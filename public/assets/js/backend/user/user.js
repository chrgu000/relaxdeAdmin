define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user/user/index',
                    add_url: 'user/user/add',
                    // edit_url: 'user/user/edit',
                    del_url: 'user/user/del',
                    multi_url: 'user/user/multi',
                    table: 'user',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'uid', title: __('Uid')},
                        {field: 'username', title: __('Username')},
                        // {field: 'nickname', title: __('Nickname')},
                        // {field: 'password', title: __('Password')},
                        // {field: 'salt', title: __('Salt')},
                        // {field: 'addr', title: __('Addr')},
                        
                        {field: 'avatar', title: __('Avatar'),formatter: Table.api.formatter.image},

                        // {field: 'level', title: __('Level'), visible:false, searchList: {"1) unsigne":__('1) unsigne')}},
                        // {field: 'level_text', title: __('Level'), operate:false},
                        {field: 'gender', title: __('Gender'), formatter: function (value) {
                                return value == '1' ? __('男') : __('女');
                            }},
                        {field: 'mobile', title: __('Mobile')},
                        // {field: 'gender_text', title: __('Gender'), operate:false},
                        // {field: 'birthday', title: __('Birthday'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'idnumber', title: __('Idnumber')},
                        {field: 'sign', title: __('Sign')},
                        {field: 'gold', title: __('Gold')},
                        {field: 'score', title: __('Score')},
                        // {field: 'successions', title: __('Successions')},
                        // {field: 'maxsuccessions', title: __('Maxsuccessions')},
                        // {field: 'prevtime', title: __('Prevtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        // {field: 'logintime', title: __('Logintime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'city', title: __('City')},
                        // {field: 'loginfailure', title: __('Loginfailure'), visible:false, searchList: {"1) unsigne":__('1) unsigne')}},
                        // {field: 'loginfailure_text', title: __('Loginfailure'), operate:false},
                        {field: 'constellation', title: __('Constellation')},
                        // {field: 'jointime', title: __('Jointime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        // {field: 'token', title: __('Token')},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.status},
                        // {field: 'openid', title: __('Openid')},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});