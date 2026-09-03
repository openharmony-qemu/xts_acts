import router from '@system.router';

export default {
    data: {
        txPassColor: '#555555', txFailColor: '#555555',
        opPassColor: '#555555', opFailColor: '#555555',
        barPassColor: '#555555', barFailColor: '#555555',
        inPassColor: '#555555', inFailColor: '#555555',
        barData: [
            { fillColor: '#f07826', data: [763, 550, 551, 554, 731, 654, 525, 696, 595, 628] },
            { fillColor: '#cce5ff', data: [535, 776, 615, 444, 694, 785, 677, 609, 562, 410] },
            { fillColor: '#ff88bb', data: [673, 500, 574, 483, 702, 583, 437, 506, 693, 657] }
        ],
        barOps: { xAxis: { min: 0, max: 20, display: false, axisTick: 10 }, yAxis: { min: 0, max: 1000, display: false } },
        clickMsg: '', inBtnColor: '#444444',
        sliderValue: 50,
        slPassColor: '#555555', slFailColor: '#555555',
        arcVal: 10, horizontalVal: 10,
        prPassColor: '#555555', prFailColor: '#555555',
        qrColor: '#87ceeb', qrBackgroundColor: '#f0ffff', qrValue: 'value',
        qrPassColor: '#555555', qrFailColor: '#555555'
    },
    imgBtnClick() { this.clickMsg = 'Button clicked!'; this.inBtnColor = (this.inBtnColor === '#2196f3') ? '#444444' : '#2196f3'; },
    onSliderChange(e) { this.sliderValue = e.progress; },
    changeHorizontal() { this.horizontalVal += 10; },
    changeArc() { this.arcVal += 10; },
    changeColor() { this.qrColor = (this.qrColor === '#87ceeb') ? '#fa8072' : '#87ceeb'; },
    changeBackgroundColor() { this.qrBackgroundColor = (this.qrBackgroundColor === '#f0ffff') ? '#fff000' : '#f0ffff'; },
    changeValue() { this.qrValue = (this.qrValue !== 'value') ? 'value' : this.qrValue + 'qrcode'; },
    passTx() { getApp().data.testItems['text_largeColor'].status = 'pass'; this.txPassColor = '#4caf50'; this.txFailColor = '#555555'; },
    failTx() { getApp().data.testItems['text_largeColor'].status = 'fail'; this.txFailColor = '#f44336'; this.txPassColor = '#555555'; },
    passOp() { getApp().data.testItems['opacity'].status = 'pass'; this.opPassColor = '#4caf50'; this.opFailColor = '#555555'; },
    failOp() { getApp().data.testItems['opacity'].status = 'fail'; this.opFailColor = '#f44336'; this.opPassColor = '#555555'; },
    passBar() { getApp().data.testItems['chart_bar_complex'].status = 'pass'; this.barPassColor = '#4caf50'; this.barFailColor = '#555555'; },
    failBar() { getApp().data.testItems['chart_bar_complex'].status = 'fail'; this.barFailColor = '#f44336'; this.barPassColor = '#555555'; },
    passIn() { getApp().data.testItems['input'].status = 'pass'; this.inPassColor = '#4caf50'; this.inFailColor = '#555555'; },
    failIn() { getApp().data.testItems['input'].status = 'fail'; this.inFailColor = '#f44336'; this.inPassColor = '#555555'; },
    passSl() { getApp().data.testItems['slider_drag'].status = 'pass'; this.slPassColor = '#4caf50'; this.slFailColor = '#555555'; },
    failSl() { getApp().data.testItems['slider_drag'].status = 'fail'; this.slFailColor = '#f44336'; this.slPassColor = '#555555'; },
    passPr() { getApp().data.testItems['progress_bar'].status = 'pass'; this.prPassColor = '#4caf50'; this.prFailColor = '#555555'; },
    failPr() { getApp().data.testItems['progress_bar'].status = 'fail'; this.prFailColor = '#f44336'; this.prPassColor = '#555555'; },
    passQr() { getApp().data.testItems['qrcode'].status = 'pass'; this.qrPassColor = '#4caf50'; this.qrFailColor = '#555555'; },
    failQr() { getApp().data.testItems['qrcode'].status = 'fail'; this.qrFailColor = '#f44336'; this.qrPassColor = '#555555'; },
    helpClicked() {
        getApp().data.helpData = {
            step: '本页合并 7 项测试，每个方框独立判定（上下滑动查看）：\n· 文字 text：观察大/中/小字号与红色文字\n· 透明度 opacity：三张图片透明度递减\n· 柱状图 chart(bar)：多组数据柱状图\n· 输入 input：复选框/单选框/图片按钮\n· 滑块 slider：拖动滑块数值更新\n· 进度条 progress：点击线性/弧形进度条递增\n· 二维码 qrcode：点值/颜色/背景色按钮变化\n完成后点底部 back',
            result: '7 项 pass/fail 分别上报 text_largeColor、opacity、chart_bar_complex、input、slider_drag、progress_bar、qrcode。点 pass 变绿、fail 变红。',
            url: 'pages/ArkUI/ui_basic/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() { router.replace({ uri: 'pages/ArkUI/common/index/index' }); },
    backClicked() { this.back(); }
};
