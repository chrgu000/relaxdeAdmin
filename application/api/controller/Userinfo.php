<?php 
namespace app\api\controller;
header('Access-Control-Allow-Origin:*');
header("content-type:text/html;charset=utf-8");
// header('Content-Type:application/json');
use app\common\controller\Api;
use app\common\model\Area;
use app\common\model\Version;
use fast\Random;
use fast\User;
// use fast\ErrorCode;
// use fast\WxBizDataCrypt;
use think\Config;
use think\Db;
include_once "wxBizDataCrypt.php";
/**
 * 我的
 */
class Userinfo extends Api
{
	  protected $noNeedLogin = '*';
    protected $noNeedRight = '*';

    

    // public function getopenid($code){
    // 	// $code = $this->request->get('code');
    //    $appid = 'wxc89d469693cad993';
    //    $appsecret = '7e04de5f6b3f3d646ad2d72305369ba9';
    //    $url = "https://api.weixin.qq.com/sns/jscode2session?appid=".$appid."&secret=".$appsecret."&js_code=".$code."&grant_type=authorization_code";
    //    $result = file_get_contents($url);
    //    $result =json_decode($result,true);
    //    $openid = $result['openid'];
    //    return $openid;
    // }
    public function index(){
    	$code = $this->request->post('code');
      $appid = 'wxc89d469693cad993';
      $appsecret = '7e04de5f6b3f3d646ad2d72305369ba9';
      $url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$appid.'&secret='.$appsecret.'&js_code='.$code.'&grant_type=authorization_code';
      $result = file_get_contents($url);
      $result =json_decode($result,true);
      // return json($result);
    	$openid = $result['openid'];

    	$info = db('user')->where(['openid' => $openid])->field('uid,openid')->find();
    	if ($info) {
        $info['session_key'] = $result['session_key'];
    		return $this->success('请求成功',$info);
    	}else{
    		if (db('user')->select()) {
    			$uid = db('user')->field('uid')->order('id DESC')->limit(1)->find();
    			db('user')->insert(['uid'=>$uid['uid']+1,'openid'=>$openid,'createtime'=>time()]);
    		}else{
    			db('user')->insert(['uid'=>1000001,'openid'=>$openid,'createtime'=>time()]);
    		}
    		$info = db('user')->where(['openid' => $openid])->field('uid,openid')->find();
        $info['session_key'] = $result['session_key'];
    		return $this->success('请求成功',$info);
    	}
    }


    public function login(){
    	$uid = $this->request->post('uid');
		  $nickname = $this->request->post('nickName');
		  $avatar = $this->request->post('avatarUrl');
    	$gender = $this->request->post('gender');
      $encryptedData = $this->request->post('encryptedData');
      $sessionkey = $this->request->post('sessionkey');
      $iv = $this->request->post('iv');
      $appid = 'wxc89d469693cad993';
    	$data = db('user')->where(['uid'=>$uid])->field('nickname,avatar')->find();
        // var_dump($data) ;
        // exit();
    	// return json($data);
    	if (!$data['nickname']) {
    		db('user')->where(['uid'=>$uid])->field('nickname,avatar,updatetime,gender')
				->update(['nickname'=>urlencode($nickname),'avatar'=>$avatar,'updatetime'=>time(),'gender'=>$gender]);
    	}
    	$info = db('user')->where(['uid'=>$uid])->field('uid,nickname,username,avatar,sign,gender,gold,score,mobile,city,constellation,idnumber,birthday,isnew')->find();
    	$info['nickname'] = urldecode($info['nickname']);
      $pc = new WxBizDataCrypt($appid, $sessionkey);
      $errCode = $pc->decryptData($encryptedData, $iv, $data );

      if ($errCode==0) {
        $unionid = json_decode($data,true);
        $info['unionid'] = $unionid['unionId'];
      }else{
        $info['errCode'] = $errCode;
      }
    	return $this->success('请求成功',$info);
    }

  //  public function decryptData($encryptedData, $iv, &$data){
  //     if (strlen($this->sessionKey) != 24) {
  //       return ErrorCode::$IllegalAesKey;
  //     }
  //     $aesKey=base64_decode($this->sessionKey);

          
  //     if (strlen($iv) != 24) {
  //       return ErrorCode::$IllegalIv;
  //     }
  //     $aesIV=base64_decode($iv);

  //     $aesCipher=base64_decode($encryptedData);

  //     $result=openssl_decrypt( $aesCipher, "AES-128-CBC", $aesKey, 1, $aesIV);

  //     $dataObj=json_decode( $result );
  //     if( $dataObj  == NULL )
  //     {
  //       return ErrorCode::$IllegalBuffer;
  //     }
  //     if( $dataObj->watermark->appid != $this->appid )
  //     {
  //       return ErrorCode::$IllegalBuffer;
  //     }
  //     $data = $result;
  //     return ErrorCode::$OK;

  // }

	public function message(){
	  $mobile = $this->request->get('mobile');
	  $rand = rand(111111, 999999);
	  $urlsend="http://120.55.197.77:1210/Services/MsgSend.asmx/SendMsg";
	  $token=array("userCode"=>"YLYLCF","userPass"=>"y1aZpqPg","DesNo"=>"".$mobile."","Msg"=>"尊敬的“轻松一刻”用户，您本次的验证码是:".$rand."。请您及时完成验证码输入。若非您本人操作，请忽略。【轻松一刻】","Channel"=>"0");
	  $phone = db('code')->where(['mobile' => $mobile])->find();
	  if ($phone) {
	    $time = db('code')->where(['mobile' => $mobile])->field('createtime')->find();
	    if (time() - $time['createtime'] > 60) {
	      $this->http($urlsend,$token,"POST");
	      db('code')->where(['mobile' => $mobile])->update(['code' => $rand, 'createtime' => time()]);
	      return $this->success('发送成功');
	    } else {
	      return $this->error('一分钟只能发送一次');
	    }
	  } else {
	    $this->http($urlsend,$token,"POST");
	    db('code')->insert(['mobile' => $mobile, 'code' => $rand, 'createtime' => time()]);
	    return $this->success('发送成功');
	  }
	}

	public function affirm(){
		$mobile = $this->request->get('mobile');
		$code = $this->request->get('code');
		$uid = $this->request->get('uid');
		$state = db('code')->where(['mobile'=>$mobile])->field('code')->find();
		if ($code == $state['code']) {
			db('user')->where(['uid'=>$uid])->update(['mobile'=>$mobile]);
			return $this->success('验证成功');
		}else{
			return $this->error('验证码错误');
		}
	}

	public function idcard(){
		$uid = $this->request->get('uid');
		$name = $this->request->get('name');
		$username = urlencode($name);
		$mobile = $this->request->get('mobile');
		$idcard = $this->request->get('idcard');
		$addr = "http://api.chinadatapay.com/communication/personal/1979?key=2ba949018ed50645611caf3698588c2b&name=".$username."&idcard=".$idcard."&mobile=".$mobile;
		$postData = array(
			"key" => '2ba949018ed50645611caf3698588c2b',
			"name" => $username,
			'idcard' => $idcard,
			'mobile'=>$mobile
		);
		$result = $this->postCurl($addr,$postData,'json');
		$result = json_decode($result);
		// var_dump($result);
		// exit();
		if ($result->data->state == 1) {
			db('user')->where(['uid'=>$uid])->update(['username'=>$name,'idnumber'=>$idcard,'mobile'=>$mobile]);
			$info = db('user')->where(['uid'=>$uid])->field('uid,nickname,username,avatar,sign,gender,gold,score,mobile,city,constellation,idnumber,birthday,isnew')->find();
    		$info['nickname'] = urldecode($info['nickname']);
    		return $this->success('请求成功',$info);
		}else{
			return $this->error('请求失败');
		}
	}
	public function http($url,$param,$action="GET")
	{
		$ch=curl_init();
		$config=array(CURLOPT_RETURNTRANSFER=>true,CURLOPT_URL=>$url);	
		if($action=="POST"){
			$config[CURLOPT_POST]=true;		
		}
		$config[CURLOPT_POSTFIELDS]=http_build_query($param);
		curl_setopt_array($ch,$config);	
		$result=curl_exec($ch);	
		curl_close($ch);
		return $result;
	}

	//发送post请求
    public function postCurl($addr,$postData,$type)
    {
        if($type == 'json'){
            $postData = json_encode($postData);//对数组进行json编码
            $header= array("Content-type: application/json;charset=UTF-8","Accept: application/json","Cache-Control: no-cache", "Pragma: no-cache");
        }
        $curl = curl_init();
        curl_setopt($curl,CURLOPT_URL,$addr);
        curl_setopt($curl,CURLOPT_POST,1);
        curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,false);
        curl_setopt($curl,CURLOPT_SSL_VERIFYHOST,false);
        if(!empty($postData)){
            curl_setopt($curl,CURLOPT_POSTFIELDS,$postData);
        }
        curl_setopt($curl,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($curl,CURLOPT_HTTPHEADER,$header);
        $res = curl_exec($curl);
        if(curl_errno($curl)){
            echo 'Error+'.curl_error($curl);
        }
        curl_close($curl);
        return $res;
    }

    //修改信息
    public function edit_info(){
    	$uid = $this->request->post('uid');
    	$nickname = $this->request->post('nickname');
    	$birthday = $this->request->post('birthday');
    	$city = $this->request->post('city');
    	$sign = $this->request->post('sign');
      $constellation = $this->request->post('constellation');
    	$file = request()->file('file');
    	$info = $file->move('C:/phpStudy/PHPTutorial/WWW/relaxed/public/'.'uploads'.DS.'images');
    	$now = time();
    	$timens = date('Ymd', $now);
    	$path = "https://picc.18178.net/relaxed/public/uploads/images/" . $timens . "/" . $info->getFilename();
    	db('user')->where(['uid'=>$uid])->update(['avatar'=>$path,'nickname'=>$nickname,'birthday'=>$birthday,'city'=>$city,'sign'=>$sign,'constellation'=>$constellation]);
    	$info = db('user')->where(['uid'=>$uid])->field('uid,nickname,username,avatar,sign,gender,gold,score,mobile,city,constellation,idnumber,birthday,isnew')->find();
    	echo json_encode($info);
    }

    //背景轮播
    public function user_slideshow(){
        $data = db('userslideshow')->field('image')->find();
        $data['image'] = 'https://picc.18178.net/relaxed/public'.$data['image'];
        return $this->success('请求成功',$data);
    }


     // 用户通知  未阅读数量 
       public function usenotice()
       {
         $uid = $this->request->post('uid');

         $DBB = DB::name('notices')->where(['uid'=>$uid,'type'=>'no'])->count();
         echo  json_encode($DBB);
       }


      //通知 详情
      public function notices()
      {
        $uid = $this->request->post('uid');
        $id  = $this->request->post('index');
        $res = DB::name('notices')->where(['uid'=>$uid])->limit( ($id * 10) , 10)->order('id desc')->select();
        $num = DB::name('notices')->where(['uid'=>$uid,'type'=>'no'])->field('count(id)')->find();
        foreach ($res as $key => $value) {
            $res[$key]['createtime'] = date('Y-m-d H:i',$res[$key]['createtime']);
            $res[$key]['num'] = $num['count(id)'];
        }
        if ($res) {
          return $this->success('请求成功',$res);
        }
        else{
          return $this->error('暂时没有消息通知');
        }
        
      }
      public function noticeedit()
      {
          $uid = $this->request->post('uid');
          $id  = $this->request->post('id');

          DB::name('notices')->where(['uid'=>$uid,'id'=>$id])->update(['type'=>'ok']);
      }	

      public function del_notice(){
        $uid = $this->request->post('uid');
        $id  = $this->request->post('id');
        DB::name('notices')->where(['uid'=>$uid,'id'=>$id])->delete();
      }

      //平台公告1.0
      public function affiche(){
        $data = DB::name('affiche')->field('content')->select();
        $name = db('turntable')->where(['name'=>array('neq','谢谢参与')])->field('name')->select();
        // return $this->success('请求成功',$name);
        $a = [];
        foreach ($name as $key => $value) {
          $res = strstr($name[$key]['name'],'活跃值');
          if (!$res) {
            array_push($a, $name[$key]['name']);
            $keys = array_rand($a,1);
            $rand = rand(44,88);
            $rand1 = rand(1111,9999);
            $txt = '恭喜用户1'.$rand.'****'.$rand1.'，在幸运转盘中获得'.$a[$keys].'奖励，真是运气爆棚！';
            $keys = array_rand($a,1);
            $rand = rand(44,88);
            $rand1 = rand(1111,9999);
            $affiche = '恭喜用户1'.$rand.'****'.$rand1.'，在幸运转盘中获得'.$a[$keys].'奖励，真是运气爆棚！';            
          }
        }
        $arr1['content'] = $affiche; 
        $arr['content'] = $txt;
        array_push($data, $arr);
        array_push($data, $arr1);
        return $this->success('请求成功',$data);
      }
      //公告1.1
      public function affiche_hidden(){
         $data = DB::name('affiche')->where(['sattus'=>'hidden'])->field('content')->select();
         $name = db('product')->field('name')->select();
         $keys = array_rand($name,1);
         $rand = rand(44,88);
         $rand1 = rand(1111,9999);
         $txt = '恭喜用户1'.$rand.'****'.$rand1.'，兑换了'.$name[$keys]['name'].'，请继续加油哦';
         $keys = array_rand($name,1);
         $rand = rand(44,88);
         $rand1 = rand(1111,9999);
         $affiche = '恭喜用户1'.$rand.'****'.$rand1.'，兑换了'.$name[$keys]['name'].'，请继续加油哦';
         $arr['content'] = $txt;
         $arr1['content'] = $affiche; 
         array_push($data, $arr);
         array_push($data, $arr1);
         return $this->success('请求成功',$data);
      }
      //18178
      public function interaction(){
        $mobile = $this->request->post('mobile');
        $data = db('user')->where(['mobile'=>$mobile])->field('username,avatar,mobile,idnumber,score')->find();
        if ($data) {
          return $this->success('请求成功',$data);
        }else{
          return $this->error('该号码未找到相关用户信息');
        }
      }

      //更新活跃值
      public function update_score(){
        $score = $this->request->post('score');
        $mobile = $this->request->post('mobile');
        $sum = db('user')->where(['mobile'=>$mobile])->find();
        if (db('user')->where(['mobile'=>$mobile])->update(['score'=>$sum['score']-intval($score)])) {
           $data = db('user')->where(['mobile'=>$mobile])->find();
           User::sendnotice($data['uid'],$score,'',time(),$data['score'],'updateScore');
           return $this->success('活跃值修改成功',$data);
        }else{
          return $this->error('修改失败,请检查参数');
        }
      }
      //游戏数据排行榜
      public function rankingList(){
        $uid = $this->request->post('uid');
        $gname = $this->request->post('name');
        if ($gname == '学霸学渣') {
          $url = 'https://xbxz.18178.net:4443/api.php';
        }elseif ($gname == '喵喵呢') {
          $url = 'https://znm.18178.net:4443/api.php';
        }else{
          return $this->success('暂无数据');
        }
        $res = $this->game_data($uid,$url,$gname);
        return $this->success('请求成功',$res);
      }
      //游戏数据
      public function game_data($uid,$url,$gname){
        // $uid = 1000002;//$this->request->post('uid');
        $userinfo = db('user')->where(['uid'=>$uid])->find();
        // $url = 'https://xbxz.18178.net:4443/api.php';
        $time = date('Y-m-d',time());
        $data = array(
          'action'=>'getRankList',
          'day' => $time
        );
        $res = $this->http_request($url,$data);
        $res = json_decode($res,true);
        $res = $res['data'];
        // return json($res);
        foreach ($res as $key => $value) {
          if ($res[$key]['pnumber'] == $userinfo['mobile']) {
            db('user')->where(['uid'=>$uid])->update(['score'=>$userinfo['score']+$res[$key]['score']]);
            User::sendnotice($uid,$res[$key]['score'],$gname,'','','','game');
          }
          // var_dump($res[$key].'====');
        }
        return $res;
      }

      //游戏数据(找你喵)
      // public function zgame_data(){
      //   $uid = $this->request->post('uid');
      //   $userinfo = db('user')->where(['uid'=>$uid])->find();
      //   $url = 'https://znm.18178.net:4443/api.php';
      //   $data = array(
      //     'action'=>'getRankList',
      //     'day' => '2019-01-25'
      //   );
      //   $res = $this->http_request($url,$data);
      //   $res = json_decode($res,true);
      //   // return json($res);
      //   foreach ($res as $key => $value) {
      //     if ($res[$key]['pnumber'] == $userinfop['mobile']) {
      //       db('userinfo')->where(['uid'=>$uid])->update(['score'=>$userinfo['score']+$res[$key]['score']]);
      //       User::sendnotice($uid,$res[$key]['score'],'找你喵','','','','game');
      //     }
      //   }
      // }


     function http_request($url, $data)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        if (! empty($data)) {
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        }
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        $output = curl_exec($curl);
        curl_close($curl);
        return $output;
    }
}
?>