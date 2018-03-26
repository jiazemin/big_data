<%--
  Created by IntelliJ IDEA.
  User: soap
  Date: 2018/3/26
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>ͨ����¼</title>
    <script type="text/javascript" src="../js/echarts.min.js"></script>
</head>
<body>
<body style="height: 100%; margin: 0; background-color: #3C3F41">
<style type="text/css">
    h3 {
        font-size: 12px;
        color: #ffffff;
        display: inline
    }
</style>
<div id="container1" style="height: 90%; width: 50%; float:left"></div>
<div id="container2" style="height: 90%; width: 50%; float:right"></div>
<script type="text/javascript">
    var telephone = "${requestScope.telephone}";
    var name = "${requestScope.name}";
    var month = "${requestScope.month}";
    var count = "${requestScope.count}";
    var duration = "${requestScope.duration}";

    function paseDuration(month, duration) {
        var array = [];
        var months = month.split(",");
        var durations = duration.split(",");
        for (var i = 0; i < months.length; i++) {
            var map = {};
            map['value'] = durations[i];
            map['name'] = months[i] + '��';
            array.push(map);
        }
        return array;
    }

    //�϶����õ��ͼ
    function nightingale() {
        var call_log = document.getElementById("container2");
        var myChart = echarts.init(call_log);
        myChart.showLoading();
        var option = {
            title: {
                text: '�϶����õ��ͼ',
                subtext: '�����鹹',
                x: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                x: 'center',
                y: 'bottom',
                data: month.split(",")
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {show: true},
                    dataView: {show: true, readOnly: false},
                    magicType: {
                        show: true,
                        type: ['pie', 'funnel']
                    },
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            calculable: true,
            series: [
                {
                    name: '�뾶ģʽ',
                    type: 'pie',
                    radius: [20, 110],
                    center: ['25%', '50%'],
                    roseType: 'radius',
                    label: {
                        normal: {
                            show: false
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    lableLine: {
                        normal: {
                            show: false
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    data: paseDuration(month, duration)
                },
                {
                    name: '���ģʽ',
                    type: 'pie',
                    radius: [30, 110],
                    center: ['75%', '50%'],
                    roseType: 'area',
                    data: paseDuration(month, duration)
                }
            ]
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
        myChart.hideLoading()
    }


    function callLogBar() {
        var call_log = document.getElementById("container2");
        var myChart = echarts.init(call_log);
        myChart.showLoading();
        var option = {
            //  backgroundColor: '#2b2b2b',
            title: {
                text: 'ͨ��ʱ��',
                textStyle: {
                    color: "#fafafa",
                    //������,'normal','italic','oblique'
                    fontStyle: 'normal',
                    //�����ϸ 'normal','bold','bolder','lighter',100 | 200 | 300 | 400...
                    fontWeight: 'bold',
                    //����ϵ��
                    fontFamily: 'sans-serif',
                    //�����С
                    fontSize: 13
                }
            },

            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },

            visualMap: {
                show: false,
                min: Math.min.apply(null, duration.split(",")),
                max: Math.max.apply(null, duration.split(",")),
                inRange: {
                    colorLightness: [0, 0.7]
                }
            },
            series: [
                {
                    name: 'ͨ��ʱ��',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '50%'],
                    data: paseDuration(month, duration).sort(function (a, b) {
                        return a.value - b.value;
                    }),
                    roseType: 'radius',
                    label: {
                        normal: {
                            textStyle: {
                                color: 'rgba(255, 255, 255, 0.3)'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            lineStyle: {
                                color: 'rgba(255, 255, 255, 0.3)'
                            },
                            smooth: 0.2,
                            length: 10,
                            length2: 20
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: '#01c1c2',
                            shadowBlur: 200,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    },
                    animationType: 'scale',
                    animationEasing: 'elasticOut',
                    animationDelay: function (idx) {
                        return Math.random() * 200;
                    }
                }
            ]
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
        myChart.hideLoading()
    }

    function callLogFun() {
        var call_log = document.getElementById("container1");
        var myChart = echarts.init(call_log);
        myChart.showLoading();
        var option = {
            title: {
                text: 'ͨ������',
                textStyle: {
                    color: "#fafafa",
                    //������,'normal','italic','oblique'
                    fontStyle: 'normal',
                    //�����ϸ 'normal','bold','bolder','lighter',100 | 200 | 300 | 400...
                    fontWeight: 'bold',
                    //����ϵ��
                    fontFamily: 'sans-serif',
                    //�����С
                    fontSize: 13
                }
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['���', '���']
            },
            toolbox: {
                show: true,
                feature: {
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    dataView: {readOnly: false},
                    magicType: {type: ['line', 'bar']},
                    restore: {},
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: month.split(","),
                axisLabel: {
                    formatter: '{value} ��'
                },
                axisLine: {
                    lineStyle: {
                        color: '#ffffff',
                        width: 2
                    }
                }
            },
            yAxis: {
                type: 'value',
                axisLabel: {
                    formatter: '{value} ��'
                },
                axisLine: {
                    lineStyle: {
                        color: '#ffffff',
                        width: 2
                    }
                }
            },
            series: [
                {
                    name: 'ͨ������',
                    type: 'line',
                    data: count.split(","),
                    markPoint: {
                        data: [
                            {type: 'max', name: '���ֵ'},
                            {type: 'min', name: '��Сֵ'}
                        ]
                    },
                    markLine: {
                        data: [
                            {type: 'average', name: 'ƽ��ֵ'}
                        ]
                    },
                    itemStyle: {
                        normal: {
                            color: '#ffca29',
                            lineStyle: {
                                color: '#ffd80d',
                                width: 2
                            }
                        }
                    }
                }
            ]
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
        myChart.hideLoading()
    }
    callLogFun();
    //    callLogBar();
    nightingale();

</script>

</body>
</html>
