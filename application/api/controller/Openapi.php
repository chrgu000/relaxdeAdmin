<?php 
namespace app\api\controller;
header('Access-Control-Allow-Origin:*');
header("content-type:text/html;charset=utf-8");
use app\common\controller\Api;
use app\common\model\Area;
use app\common\model\Version;
use fast\Random;
use think\Config;

/**
 * 欧飞接口对接
 */
class Openapi extends Api
{
	
	protected $noNeedLogin = '*';
    protected $noNeedRight = '*';

    //话费充值接口
    public function recharge(){
    	$uid = $this->request->post('uid');
    	$cid =$this->request->post('cid');
    	$game_userid = $this->request->post('mobile');//手机号
    	$cardnum = $this->request->post('value');//充值金额
    	$userid = "A08566";//商家编号
    	$userpws = md5('of111111');//sp密码
    	$cardid = "140101";//快充，慢充170101
    	$sporder_id = $this->orderNumber();//商户订单号
    	$sporder_time = date('YmdHis',time());
    	$package = $userid.$userpws.$cardid.$cardnum.$sporder_id.$sporder_time.$game_userid;
    	$md5_str = strtoupper(md5($package.'OFCARD'));
    	// return $md5_str;
    	$postData = array(
    		'userid' =>$userid,
    		'userpws' =>$userpws,
    		'cardid' =>$cardid,
    		'cardnum' =>$cardnum,
    		'sporder_id' =>$sporder_id,
    		'sporder_time'=>$sporder_time,
    		'game_userid'=>$game_userid,
    		'md5_str' =>$md5_str,
    		'version' => '6.0'
    	);
    	$url = "http://apitest.ofpay.com/onlineorder.do?userid=$userid&userpws=$userpws&cardid=$cardid&cardnum=$cardnum&sporder_id=$sporder_id&sporder_time=$sporder_time&game_userid=$game_userid&md5_str=$md5_str&version=6.0";
    	// $url = "http://apitest.ofpay.com/onlineorder.do";
    	$rtn = $this->postCurl($url,$postData,'json');
    	// $rtn = file_get_contents($url);
    	$result = $this->xmlToArray($rtn);
    	$data = [
    			'uid'=>$uid,
    			'orderid' => $result['orderid'],
    			'cardid'=>$result['cardid'],
    			'cardnum'=>$result['cardnum'],
    			'ordercash'=>$result['ordercash'],
    			'cardname'=>$result['cardname'],
    			'game_userid'=>$result['game_userid'],
    			'game_state'=>$result['game_state'],
    			'createtime'=>time()
    		];
    	// var_dump($result);
    	// exit();
    	if ($result['game_state'] == 1) {
    		db('conversion')->where(['uid'=>$uid,'id'=>$cid])->update(['status'=>'已使用']);
    		db('openapi')->insert($data);
    		return $this->success('充值成功');
    	}elseif ($result['game_state'] == 0) {
    		return $this->error('正在充值中，请稍后');
    	}else{
    		db('openapi')->insert($data);
    		return $this->error('充值失败');
    	}
    }

    //生成商户订单号，自定义规则
    private function orderNumber()
    {
        $data = date('YmdHis', time()); //14位时间
        //生成8位随机数
        $a_mt = mt_rand(1000, 9999);
        $b_mt = mt_rand(1000, 9999);
        $c_mt = $a_mt . $b_mt;
        return $data . $c_mt; //凑齐22位商户订单号
    }

    //发送post请求
    private function postCurl($url,$postData,$type)
    {
        if($type == 'json'){
            $postData = json_encode($postData);//对数组进行json编码
            $header= array("Content-type: application/json;charset=UTF-8","Accept: application/json","Cache-Control: no-cache", "Pragma: no-cache");
        }
        $curl = curl_init();
        curl_setopt($curl,CURLOPT_URL,$url);
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

    //将xml转换成php数组
	private function xmlToArray($xml){
	    if (file_exists($xml)) {
	        libxml_disable_entity_loader(false);
	        $xml_string = simplexml_load_file($xml,'SimpleXMLElement', LIBXML_NOCDATA);
	    }else{
	        libxml_disable_entity_loader(true);
	        $xml_string = simplexml_load_string($xml,'SimpleXMLElement', LIBXML_NOCDATA);
	    }
	    $result = json_decode(json_encode($xml_string),true);
	    return $result;
	}


	//卡密提取接口
	public function cardpws(){
		$uid = $this->request->post('uid');
		$name = $this->request->post('name');
		$cardid = $this->request->post('cardid');//卡号，，由欧飞提供给商家
		$cardnum = $this->request->post('cardnum');//卡数量
		$userid = "A08566";//商家编号
		$userpws = md5('of111111');//sp密码
		$sporder_id = $this->orderNumber();//商户订单号
    	$sporder_time = date('YmdHis',time());
    	$package = $userid.$userpws.$cardid.$cardnum.$sporder_id.$sporder_time;
    	$md5_str = strtoupper(md5($package.'OFCARD'));
    	$postData = array(
    		'userid' =>$userid,
    		'userpws' =>$userpws,
    		'cardid' =>$cardid,
    		'cardnum' =>$cardnum,
    		'sporder_id' =>$sporder_id,
    		'sporder_time'=>$sporder_time,
    		'md5_str' =>$md5_str,
    		'version' => '6.0'
    	);
    	$url = "http://apitest.ofpay.com/order.do?userid=$userid&userpws=$userpws&cardid=$cardid&cardnum=$cardnum&sporder_id=$sporder_id&sporder_time=$sporder_time&md5_str=$md5_str&version=6.0";
    	// $url = ":http://apitest.ofpay.com/order.do";
    	$rtn = $this->postCurl($url,$postData,'json');
    	$result = $this->xmlToArray($rtn);
    	// return json($result['cards']['card']['cardno']);

    		if ($result['retcode'] == 1) {
    			$data = [
    			'uid'=>$uid,
    			'orderid' => $result['orderid'],
    			'cardid'=>$result['cardid'],
    			'cardnum'=>$result['cardnum'],
    			'ordercash'=>$result['ordercash'],
    			'cardname'=>$result['cardname'],
    			'cardno'=>$result['cards']['card']['cardno'],
    			'cardpws'=>$result['cards']['card']['cardpws'],
    			'expiretime'=>$result['cards']['card']['expiretime'],
    			'createtime'=>time()
    		     ];
	    		db('conversion')->where(['uid'=>$uid,'pname'=>$name])->update(['expiretime'=>$result['cards']['card']['expiretime']]);
	    		db('openapi')->insert($data);
	    		return $this->success('卡密提取成功',$result);
	    	}else{
	    		// db('openapi')->insert($data);
	    		return $this->error('卡密提取失败',$result);
	    	}
	}

	//查询卡密商品库存
	public function invwentory(){
		$cardno = db('product')->where(['carid'=>array('neq','无')])->select();
        // return json($cardno);
		foreach ($cardno as $key => $value) {
			if ($cardno[$key]['carid']) {
				$cardid = $cardno[$key]['carid'];
				$userid = "A08566";//商家编号
			$userpws = md5('of111111');//sp密码
			$postData = array(
	    		'userid' =>$userid,
	    		'userpws' =>$userpws,
	    		'cardid' =>$cardid,
	    		'version' => '6.0'
	    	);
	    	$url = "http://apitest.ofpay.com/queryleftcardnum.do?userid=$userid&userpws=$userpws&cardid=$cardid&version=6.0";
	    	$rtn = $this->postCurl($url,$postData,'json');
	    	$result = $this->xmlToArray($rtn);
            // return json($result);
	    	$num = $result['ret_cardinfos']['card']['innum'];
	    	db('product')->where(['id'=>$cardno[$key]['id']])->update(['sum'=>$num,'surplus'=>$num]);
			}
		}

	}


}
?>