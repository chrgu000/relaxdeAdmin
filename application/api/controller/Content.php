<?php 
namespace app\api\controller;
header('Access-Control-Allow-Origin:*');
header("content-type:text/html;charset=utf-8");
use app\common\controller\Api;
use app\common\model\Area;
use app\common\model\Version;
use fast\Random;
use fast\User;
use think\Config;
use think\Db;

/**
 * 游戏
 */
class  Content extends Api
{
	
	protected $noNeedLogin = '*';
    protected $noNeedRight = '*';
    //Banner图
    public function slideshow(){
    	$data = db('gslideshow')->where(['status'=>'normal'])->field('image,url')->select();
    	return $this->success('请求成功',$data);
    }
    //活动
    public function activity(){
    	$data = db('activity')->where(['status'=>'normal'])->field('id,image,title,desc,url')->order('weigh DESC')->select();
    	if (empty($data)) {
    		return $this->error('暂时没有活动');
    	}
    	return $this->success('请求成功',$data);
    }
    //游戏
    public function games(){
    	// $solt = chr(rand(97,122)).chr(rand(97,122)).chr(rand(97,122)).chr(rand(97,122));
    	// echo $solt;
    	// exit();
    	$data = db('games')->where(['status'=>'normal'])->field('image,title,desc,appid')->order('weigh DESC')->select();
    	if (empty($data)) {
    		return $this->error('暂时没有游戏');
    	}
    	return $this->success('请求成功',$data);
    }

    //公告
    public function notice(){
    	$txt = db('notice')->field('content')->find();
    	return $this->success('请求成功',$txt);
    }
    //新手礼包
    public function usergift(){
    	$data = db('usergift')->field('image,images,title')->find();
    	return $this->success('请求成功',$data);
    }
    //领取礼包
    public function getgift(){
        $uid = $this->request->get('uid');
        $score = db('usergift')->find();
        db('user')->where(['uid'=>$uid])->update(['score'=>$score['title'],'isnew'=>1]);
        $info = db('user')->where(['uid'=>$uid])->field('uid,nickname,username,avatar,sign,gender,gold,score,mobile,city,constellation,idnumber,birthday,isnew')->find();
        db('score')->insert(['username'=>$info['username'],'type'=>'新手礼包','score1'=>0,'score2'=>$info['score'],'num'=>$score['title'],'createtime'=>time()]);
        $info['nickname'] = urldecode($info['nickname']);
        User::sendnotice($uid,'',$info['nickname'],'','','newsuser');
        return $this->success('请求成功',$info);
    }

    //礼品兑换
    public function present(){
        $data = db('product12')->where(['status'=>'normal'])->field('id,image,name,url')->order('weigh DESC')->select();
        return $this->success('请求成功',$data);
    }
    //商品详情
    public function p_info(){
        $pid = $this->request->post('pid');
        $data = db('product12')->where(['id'=>$pid,'status'=>'normal'])->field('id,image,name,price,surplus,url')->find();
        $data['num'] = 1;
        return $this->success('请求成功',$data);
    }
    //商品详情图片
    public function p_desc(){
        $pid = $this->request->post('pid');
        $data = db('pdesc')->where(['pid'=>$pid])->field('images')->find();
        $data['images'] = explode(',', $data['images']);
        return $this->success('请求成功',$data);
    }

    //转盘描述
    public function turndesc(){
        $info = db('turndesc')->find();
        return $this->success('请求成功',$info);
    }

    //抽奖
    public function award(){
        $uid = $this->request->post('uid');
        $today=strtotime(date('Y-m-d 00:00:00'));
        $num = db('record')->where(['createtime'=>array('egt',$today)])->field('sum(value)')->find();
        $score = db('user')->where(['uid'=>$uid])->find();
        $cishu = db('record')->where(['createtime'=>array('egt',$today),'uid'=>$uid])->field('count(uid)')->find();
        $rmb = $num['sum(value)']/200;
        $nums = db('turntableconfig')->find();
        // return $nums['astrict'];
        if ($cishu['count(uid)'] == $nums['num'] || $cishu['count(uid)'] > $nums['num']) {
            return $this->error('今日抽奖次数已经用完啦');
        }
        if ($nums['astrict'] == -1) {
           $res = $this->turntable();
           $value =db('turntable')->where(['id'=>$res])->find();
           db('record')->insert(['uid'=>$uid,'pid'=>$value['id'],'value'=>$value['value'],'createtime'=>time()]);
           $data = [
                'id' => $value['id'],
                'name'=>$value['name'],
                'image'=>'https://picc.18178.net/relaxed/public'.$value['image']
           ];
           $res = strstr($value['name'], '活跃值');
           if ($res) {
               $data['score'] = $score['score']+$value['face_value'];
               User::sendnotice($uid,$value['face_value'],'','','','score');
           }else{
                if ($value['name'] != '谢谢参与') {
                    User::sendnotice($uid,$value['num'],$value['name'],'Award');
                }
           }
           
           $this->aog($uid,$value['id'],$value['name']);
           return $this->success('请求成功',$data);
        }elseif ($rmb == $nums['astrict'] || $rmb > $nums['astrict']) {
            $value =db('turntable')->where(['name'=>'谢谢参与'])->find();
            db('record')->insert(['uid'=>$uid,'pid'=>$value['id'],'value'=>$value['value'],'createtime'=>time()]);
           $data = [
                'id' => $value['id'],
                'name'=>$value['name'],
                'image'=>'https://picc.18178.net/relaxed/public'.$value['image']
           ];
            return $this->success('请求成功',$data);
        }else{
            $res = $this->turntable();
            $value =db('turntable')->where(['id'=>$res])->find();
           db('record')->insert(['uid'=>$uid,'pid'=>$value['id'],'value'=>$value['value'],'createtime'=>time()]);
           $data = [
                'id' => $value['id'],
                'name'=>$value['name'],
                'image'=>'https://picc.18178.net/relaxed/public'.$value['image']
           ];
           $res = strstr($value['name'], '活跃值');
           if ($res) {
               $data['score'] = $score['score']+$value['face_value'];
               User::sendnotice($uid,$value['face_value'],'','','','score');
           }else{
                if ($value['name'] != '谢谢参与') {
                    User::sendnotice($uid,$value['num'],$value['name'],'','','Award');
                }
           }
           $this->aog($uid,$value['id'],$value['name']);
           return $this->success('请求成功',$data);
        }
    }

    //奖励到账
    public function aog($uid,$pid,$name){
        $res = strstr($name, '活跃值');
        // return type($res);
        $data = db('user')->where(['uid'=>$uid])->find();
        $score = db('turntable')->where(['id'=>$pid])->find();
        if ($res) {
            // return 123;
            db('user')->where(['uid'=>$uid])->update(['score'=>$data['score']+$score['face_value']]);
            db('score')->insert(['username'=>$data['username'],'type'=>'大转盘','score1'=>$data['score'],'score2'=>$data['score']+$score['face_value'],'num'=>$score['face_value'],'createtime'=>time()]);
        }elseif($name != '谢谢参与'){
            $info = [
                'uid'=>$uid,
                'avatar'=>$data['avatar'],
                'username'=>$data['username'],
                'mobile'=>$data['mobile'],
                'pname'=>$score['name'],
                'image'=>$score['image'],
                'num'=>$score['num'],
                'value'=>$score['value']*$score['num'],
                'face_value'=>$score['face_value']*$score['num'],
                'souerce'=>'抽奖',
                'createtime'=>time()
            ];
            db('conversion')->insert($info);
        }
    }

    //转盘抽奖
    public function turntable(){
        $prize_arr = db('turntable')->field('id,name,probability')->select();
        // $arr = [];
        foreach ($prize_arr as $key => $val) {  
         $arr[$val['id']] = $val['probability'];//概率数组  
        }  
        $rid = $this->get_rand($arr); //根据概率获取奖项id 
        // var_dump($rid);
        // exit(); 
        $res['yes'] = $prize_arr[$rid-1]['name']; //中奖项
        $res['yess'] = $prize_arr[$rid-1]['id']; 
        unset($prize_arr[$rid-1]); //将中奖项从数组中剔除，剩下未中奖项  
        shuffle($prize_arr); //打乱数组顺序  
        for($i=0;$i<count($prize_arr);$i++){  
         $pr[] = $prize_arr[$i]['name']; //未中奖项数组 
        }  
        $res['no'] = $pr; 
        // var_dump($res);
     
          
        // if($res['yes']!='谢谢参与'){ 
        //   $result['status']=1; 
        //   $result['name']=$res['yes'];
        //   $result['pid']=$res['yess']; 
        // }else{ 
        //   $result['status']=-1; 
        //   $result['msg']=$res['yes'];
        //   $result['pid']=$res['yess']; 
        // }  
        return $res['yess']; 
        // var_dump($result);
        // echo json_encode($result);
        
    }
     
    //计算中奖概率
    public function get_rand($proArr) {  
       $result = '';  
       //概率数组的总概率精度  
       $proSum = array_sum($proArr);  
       // var_dump($proSum);
       //概率数组循环  
       foreach ($proArr as $key => $proCur) {  
        $randNum = mt_rand(1, $proSum); //返回随机整数 
     
        if ($randNum <= $proCur) {  
         $result = $key;  
         break;  
        } else {  
         $proSum -= $proCur;  
        }  
       }  
       unset ($proArr);  
       return $result; 
    }

    //提交订单
    public function indent(){
        $uid = $this->request->post('uid');
        $pid = $this->request->post('pid');
        $num = $this->request->post('num');
        $value = $this->request->post('value');
        $formid = $this->request->post('formid');
        $userinfo = db('user')->where(['uid'=>$uid])->field('avatar,username,mobile,score')->find();
        // return $formid;
        // return json($userinfo);
        if ($value > $userinfo['score']) {
            return $this->error('活跃值不够');
        }
        $pinfo = db('product')->where(['id'=>$pid])->field('image,name,price')->find();
        $data = [
            'uid' => $uid,
            'avatar' => $userinfo['avatar'],
            'username' => $userinfo['username'],
            'mobile' => $userinfo['mobile'],
            'pname' => $pinfo['name'],
            'image' => $pinfo['image'],
            'num' => $num,
            'value'=>$value,
            'formid'=>$formid,
            'createtime'=>time()
        ];
        db('indent')->insert($data);
        // $surplus = 
        db('user')->where(['uid'=>$uid])->field('score')->update(['score'=>$userinfo['score']-$value]);
        $score = db('user')->where(['uid'=>$uid])->find();
        db('score')->insert(['username'=>$score['username'],'type'=>'礼品兑换','score1'=>$userinfo['score'],'score2'=>$score['score'],'num'=>$value,'createtime'=>time()]);
        $data['score'] = $score['score'];
        User::sendnotice($uid,'',$data['pname'],$data['createtime'],'','indent');
        return $this->success('请求成功',$data);
    }

    //剩余次数
    public function surplus_num(){
        $uid = $this->request->post('uid');
        $sum = db('turntableconfig')->find();
        $today=strtotime(date('Y-m-d 00:00:00'));
        $cishu = db('record')->where(['createtime'=>array('egt',$today),'uid'=>$uid])->field('count(uid)')->find();
        // return $cishu['count(uid)'];
        $res = $sum['num'] - $cishu['count(uid)'];
        if ($res < 0) {
            $res = 0;
        }
        return $this->success('请求成功',$res);
    }
    //转盘商品
    public function shangpin(){
        $product = db('turntable')->select();
        foreach ($product as $key => $value) {
            $product[$key]['image'] = 'https://picc.18178.net/relaxed/public/'.$product[$key]['image'];
        }
        return $this->success('请求成功',$product);
    }

    //兑换记录_审核中
    public function w_conversion(){
        $uid = $this->request->post('uid');
        $data = db('indent')->where(['uid'=>$uid])->select();
        foreach ($data as $key => $value) {
            $data[$key]['image'] = 'https://picc.18178.net/relaxed/public'.$data[$key]['image'];
            $data[$key]['createtime'] = date('Y-m-d H:i:s',$data[$key]['createtime']);
        }
        if ($data) { 
           return $this->success('请求成功',$data);
        }else{
            return $this->error('暂时没有审核中的礼品');
        }
    }
    //兑换记录_已审核
    public function conversion(){
        $uid = $this->request->post('uid');
        $data = db('conversion')->where(['uid'=>$uid,'status'=>'未使用'])->select();
        foreach ($data as $key => $value) {
            $value = db('product')->where(['name'=>$data[$key]['pname']])->find();
            $expiretime = strtotime(date('Y-m-d',strtotime($data[$key]['expiretime'])));
            $now = strtotime(date('Y-m-d',time()));
            // var_dump($expiretime,$now);
            // exit();
            $expiretimeday = ($expiretime - $now) / 86400;
            $data[$key]['expiretimeday'] = $expiretimeday;
            $data[$key]['image'] = 'https://picc.18178.net/relaxed/public'.$data[$key]['image'];
            $data[$key]['createtime'] = date('Y-m-d H:i:s',$data[$key]['createtime']);
            $data[$key]['value'] = $value['value'];
            $data[$key]['cardid'] = $value['carid'];
        }
        if ($data) {
           return $this->success('请求成功',$data);
        }else{
            return $this->error('暂时没有通过审核的礼品');
        }
    }

    //兑换记录
    public function record(){
        $index = $this->request->post('index');
        $uid = $this->request->post('uid');
        $data = db('conversion')->where(['uid'=>$uid,'status'=>$index])->select();
        foreach ($data as $key => $value) {
            $data[$key]['image'] = 'https://picc.18178.net/relaxed/public'.$data[$key]['image'];
            $data[$key]['createtime'] = date('Y-m-d H:i:s',$data[$key]['createtime']);
        }
        if ($data) {
           return $this->success('请求成功',$data);
        }else{
            return $this->error('暂时没有'.$index.'的礼品');
        }
    }

    //删除礼品
    public function del_product(){
        $uid = $this->request->post('uid');
        $id  = $this->request->post('id');
        DB::name('conversion')->where(['uid'=>$uid,'id'=>$id])->delete();
    }


    //兑换记录提示
    public function remind(){
        $uid = $this->request->post('uid');
        $res = db('indent')->where(['type'=>'no','uid'=>$uid])->count();
        return $this->success('请求成功',$res);
    }

    //修改状态
    public function edit_type(){
        $uid = $this->request->post('uid');
        db('indent')->where(['uid'=>$uid])->update(['type'=>'ok']);
        return $this->success('修改成功');
    }


    //卡卷过期提醒
    public function expiretime(){
        // echo strtotime("+1 day");
        // exit();
        $data = db('conversion')->where(['status'=>'未使用'])->select();
        foreach ($data as $key => $value) {
            if ($data[$key]['expiretime'] != '0000-00-00 00:00:00') {
                $expiretime = strtotime($data[$key]['expiretime']);
                $beforetime = $expiretime - 86400;
                $newtime = strtotime(date('Y-m-d',$beforetime));
                $time = strtotime(date('Y-m-d',time()));
                if ($time == strtotime(date('Y-m-d',$expiretime))) {
                    db('conversion')->where(['createtime'=>$data[$key]['createtime']])->update(['status'=>'已过期']);
                }
                if ($newtime == $time) {
                    User::sendnotice($data[$key]['uid'],date('Y-m-d H:i:s',$expiretime),$data[$key]['pname'],$data[$key]['createtime'],'','expiretime');
                }
            }
            
        }
    }

    //邀请好友拿现金
    public function invite(){
        $data = db('invite')->find();
        return $this->success('请求成功',$data);
    }

}
?>