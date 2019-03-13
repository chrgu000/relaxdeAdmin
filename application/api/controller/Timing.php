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
 * windows定时任务
 */
class Timing extends Api
{
	protected $noNeedLogin = '*';
    protected $noNeedRight = '*';

	//定时任务
    public function timing(){
        db('ceshi')->insert(['title'=>'测试']);
    }
}
?>