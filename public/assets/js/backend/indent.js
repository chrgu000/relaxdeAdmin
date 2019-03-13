define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'indent/index',
                    add_url: 'indent/add',
                    edit_url: 'indent/edit',
                    del_url: 'indent/del',
                    multi_url: 'indent/multi',
                    table: 'indent',
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
                        {field: 'avatar', title: __('Avatar'),formatter: Table.api.formatter.image},
                        {field: 'username', title: __('Username')},
                        {field: 'mobile', title: __('Mobile')},
                        {field: 'pname', title: __('Pname')},
                        {field: 'image', title: __('Image'), formatter: Table.api.formatter.image},
                        {field: 'num', title: __('Num')},
                        {field: 'value', title: __('Value')},
                        // {field: 'formid', title: __('Formid')},
                        // {field: 'phone', title: __('Phone')},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, buttons: [
                                {name: 'agree', text: '通过', title: '通过',confirm:'确定通过审核？',icon: '',classname: 'btn btn-xs btn-success  btn-ajax',url:'indent/agree'},
                            {name: 'reject', text: '不通过', title: '不通过',confirm:'确定驳回？',icon: '', classname: 'btn btn-xs btn-danger  btn-ajax',url:'indent/reject'}
                            ],events: Table.api.events.operate, formatter: Table.api.formatter.operate}                    ]
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