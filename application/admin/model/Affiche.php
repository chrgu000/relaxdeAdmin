<?php

namespace app\admin\model;

use think\Model;

class Affiche extends Model
{
    // 表名
    protected $name = 'affiche';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'sattus_text'
    ];
    

    
    public function getSattusList()
    {
        return ['normal' => __('Normal'),'hidden' => __('Hidden')];
    }     


    public function getSattusTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['sattus'];
        $list = $this->getSattusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
