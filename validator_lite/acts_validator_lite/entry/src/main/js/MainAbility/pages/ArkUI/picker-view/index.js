import router from '@system.router';

export default {
    data: {
        defaultTime: '',
        time: '',
    },

    onInit() {
        console.info('onInit');
        this.defaultTime = this.now();
        this.time = this.defaultTime;
    },

    handleChange(data) {
        this.time = this.concat(data.hour, data.minute);
    },

    onDestroy() {
        console.info('onDestroy');

    },

    now() {
        let date = new Date();
        let hours = date.getHours();
        let minutes = date.getMinutes();
        console.log('now hours:' + hours + ' minutes:' + minutes);
        return this.concat(hours, minutes);
    },

    fill(value) {
        return (value > 9 ? '' : '0') + value;
    },

    concat(hours, minutes) {
        return this.fill(hours) + ':' + this.fill(minutes);
    },

    helpClicked() {
        getApp().data.helpData = { step: '滑动选择器修改选择时间', result: '红色字体的时间跟随滑动选择器变化', url: 'pages/ArkUI/picker-view/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems.picker_view.status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems.picker_view.status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
