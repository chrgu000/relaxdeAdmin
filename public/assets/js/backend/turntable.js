define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'turntable/index',
                    add_url: 'turntable/add',
                    edit_url: 'turntable/edit',
                    del_url: 'turntable/del',
                    multi_url: 'turntable/multi',
                    table: 'turntable',
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
                        {field: 'image', title: __('Image'), formatter: Table.api.formatter.image},
                        {field: 'name', title: __('Name')},
                        {field: 'pid', title: __('Pid')},
                        {field: 'num', title: __('Num')},
                        {field: 'face_value', title: __('Face_value')},
                        {field: 'value', title: __('Value')},
                        {field: 'probability', title: __('Probability')},
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