<?php 
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | 修改者: Simba (user类)
// +----------------------------------------------------------------------

namespace fast;

use think\Db;
use think\Config;
use think\Session;
use think\Request;
use think\Loader;

class User{


	 /**
      * [用户通知接口 ]
      * @Auhor    Rambo
      * @param    [type]     $uid     [用户uid]
      * @param    [type]     $content [通知内容]
      * @return   [false]              [description]
      */
	 public  static function sendnotice($uid,$num,$name,$time,$sum,$type)
      {  
        if ($time) {
          $time = date('Y-m-d H:i:s',$time);
        }
        switch ($uid) {
          case $type=='score': //活跃值奖励  
            $title = '活跃值奖励';
            $content = '恭喜您，在幸运转盘中获得'.$num.'活跃值奖励，真是运气爆棚！';
            $sendname = '轻松一刻';
            break;
          case $type=='Award': //非活跃值奖励  
            $title = '中奖啦';
            $content = '恭喜您，在幸运转盘中获得'.$name.'*'.$num.'奖励，详见兑换记录-未使用界面，请在到期日前及时使用，感谢您的理解与支持！';
            $sendname = '轻松一刻';
            break;
          case $type=='indent': // 订单提交成功 
            $title = '订单提交成功';
            $content = '您在'.$time.'兑换'.$name.'的订单已提交审核，预计审核时间6~24小时，请耐心等待！';
            $sendname = '轻松一刻';
            break;
          case $type=='agree': //订单审核通过  
            $title = '订单审核通过';
            $content = '您在'.$time.'提交的订单已通过审核，本次兑换物品为'.$name.'，消耗'.$num.'活跃值，还剩'.$sum.'活跃值，详见兑换记录-未使用界面，请在到期日前及时使用，感谢您的理解与支持！';
            $sendname = '轻松一刻';
            break;
          case $type=='reject': //订单审核未通过  
            $title = '订单审核未通过';
            $content = '您在'.$time.'提交的订单未通过审核，本次兑换物品为'.$name.'，您可以关注我们的公众号“18178休闲游戏娱乐平台” 联系客服人员，感谢您的理解与支持！';
            $sendname = '轻松一刻';
            break;
            case $type=='newsuser': //首次注册  
            $title = '欢迎登录';
            $content = '亲爱的'.$name.'，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~';
            $sendname = '轻松一刻';
            break;
             case $type=='expiretime': //卡卷过期提醒  
            $title = '卡卷过期提醒';
            $content = '您在'.$time.'提交的订单，将在'.$num.'失效，本次兑换物品为'.$name.'，请尽快使用！';
            $sendname = '轻松一刻';
            break;
            case $type=='game':
            $title = '游戏积分奖励';
            $content = '恭喜您在'.$name.'获得'.$num.'活跃值!';
            $sendname = '轻松一刻';
            break;
            case $type=='updateScore':
            $title = '积分变更通知';
            $content = '您于'.$time.'在18178平台消费'.$num.'活跃值,剩余活跃值为'.$sum;
            $sendname = '轻松一刻';
            break;
        }
       
          DB::name('notices')->insert(['uid'=>$uid,'title'=>$title,'content'=>$content,'createtime'=>time(),'sendname'=>$sendname]);
      }
}
?>