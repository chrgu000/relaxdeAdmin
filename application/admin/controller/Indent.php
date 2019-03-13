<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use fast\User;
/**
 * 订单审核
 *
 * @icon fa fa-indent
 */
class Indent extends Backend
{
    
    /**
     * Indent模型对象
     * @var \app\admin\model\Indent
     */
    protected $model = null;
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Indent');

    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    public function agree(){
        $url = $this->request->url();
        $url = explode('/', $url);
        $id = end($url);
        $pname = db('indent')->where(['id'=>$id])->find();
        $info = db('product')->where(['name'=>$pname['pname']])->find();
        $data = db('token')->find();
        if ($data) {
            if (time()-$data['createtime']>=7200) {
                $access_token = $this->getwebtoken();
            }else{
                $access_token = $data['token'];
            }
        }else{
            $access_token = $this->getwebtoken();
        }
        $user = db('user')->where(['uid'=>$pname['uid']])->field('score,openid,uid')->find();
        $accessToken = $access_token;
        $postData = array(
            "touser"        =>$user['openid'],//用户openid
            "template_id"   =>'eA8WcfsIk014TRrTNSy6Ok_bOQ1ABWC2H-g3TfKBsW4',  //模板消息ID
            "page"          =>'pages/index/index',          
            "form_id"       =>$pname['formid'],//表单提交场景下，事件带上的 formId；支付场景下，为本次支付的 prepay_id 
            "data"          =>array(
                    'keyword1'  => array('value'=>'您的订单已经通过审核,点击进入小程序查看详情'),
                    'keyword2'  =>array('value'=>$pname['pname']),
                    'keyword3'  => array('value'=>date('Y-m-d H:i:s',time())),
                ),
            'emphasis_keyword'=>''
        );
        // $postData =  json_encode($postData,JSON_UNESCAPED_UNICODE);
        $addr = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token={$accessToken}";
        $rtn = $this->postCurl($addr,$postData,'json');
        db('product')->where(['id'=>$info['id']])->update(['sum'=>$info['sum']-$pname['num']]);
        $pinfo = [
            'uid' => $pname['uid'],
            'avatar' => $pname['avatar'],
            'username' => $pname['username'],
            'mobile' => $pname['mobile'],
            'pname' => $pname['pname'],
            'image' => $pname['image'],
            'num' => $pname['num'],
            'value'=>$pname['value'],
            'createtime'=>time()
        ];
        // $sum = $user['score']-$pname['value'];
        User::sendnotice($user['uid'],$pname['value'],$pname['pname'],$pname['createtime'],$user['score'],'agree');
        db('conversion')->insert($pinfo);
        db('indent')->where(['id'=>$id])->delete();
        
    }

    public function reject(){
        $url = $this->request->url();
        $url = explode('/', $url);
        $id = end($url);
        $pname = db('indent')->where(['id'=>$id])->find();
        $info = db('product')->where(['name'=>$pname['pname']])->find();
        $data = db('token')->find();
        if ($data) {
            if (time()-$data['createtime']>=7200) {
                $access_token = $this->getwebtoken();
            }else{
                $access_token = $data['token'];
            }
        }else{
            $access_token = $this->getwebtoken();
        }
        $user = db('user')->where(['uid'=>$pname['uid']])->field('openid,score,uid')->find();
        $accessToken = $access_token;
        $postData = array(
            "touser"        =>$user['openid'],//用户openid
            "template_id"   =>'eA8WcfsIk014TRrTNSy6Ok_bOQ1ABWC2H-g3TfKBsW4',  //模板消息ID
            "page"          =>'pages/index/index',          
            "form_id"       =>$pname['formid'],//表单提交场景下，事件带上的 formId；支付场景下，为本次支付的 prepay_id 
            "data"          =>array(
                   'keyword1'  => array('value'=>'您的订单未能通过审核,详情请进入小程序联系客服人员'),
                    'keyword2'  =>array('value'=>$pname['pname']),
                    'keyword3'  => array('value'=>date('Y-m-d H:i:s',time())),
                ),
            'emphasis_keyword'=>''
        );
        // $postData =  json_encode($postData,JSON_UNESCAPED_UNICODE);
        $addr = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token={$accessToken}";
        $rtn = $this->postCurl($addr,$postData,'json');
        db('user')->where(['uid'=>$pname['uid']])->update(['score'=>$user['score']+$pname['value']]);
        db('score')->insert(['username'=>$pname['username'],'type'=>'订单退还','score1'=>$user['score'],'score2'=>$user['score']+$pname['value'],'num'=>$pname['value'],'createtime'=>time()]);
        db('indent')->where(['id'=>$id])->delete();
        User::sendnotice($user['uid'],'',$pname['pname'],$pname['createtime'],'','reject');
    }

    //获取access_Token
    public function getwebtoken(){
        $appid = 'wxc89d469693cad993';
        $appsecret = '7e04de5f6b3f3d646ad2d72305369ba9';
        $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$appid&secret=$appsecret";
        $data = file_get_contents($url);
        $data = json_decode($data,true);
        if ($data) {
            db('token')->insert(['token'=>$data['access_token'],'createtime'=>time()]);
            return $data['access_token'];
        }else{
            return false;
        }
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

}
