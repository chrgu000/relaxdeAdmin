define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'conversion/index',
                    add_url: 'conversion/add',
                    edit_url: 'conversion/edit',
                    del_url: 'conversion/del',
                    multi_url: 'conversion/multi',
                    table: 'conversion',
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
                        {field: 'avatar', title: __('Avatar'), formatter: Table.api.formatter.image},
                        {field: 'username', title: __('Username')},
                        {field: 'mobile', title: __('Mobile')},
                        {field: 'pname', title: __('Pname')},
                        {field: 'image', title: __('Image'), formatter: Table.api.formatter.image},
                        {field: 'num', title: __('Num')},
                        {field: 'value', title: __('Value')},
                        // {field: 'phone', title: __('Phone')},
                        {field: 'status', title: __('Status'), visible:false, searchList: {"\u672a\u4f7f\u7528":__('\u672a\u4f7f\u7528'),"\u5df2\u4f7f\u7528":__('\u5df2\u4f7f\u7528'),"\u5df2\u8fc7\u671f":__('\u5df2\u8fc7\u671f')}},
                        {field: 'status_text', title: __('Status'), operate:false},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
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