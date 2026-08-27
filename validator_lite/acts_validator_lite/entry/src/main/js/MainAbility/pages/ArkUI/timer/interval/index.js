import router from '@system.router';

export default {
    data:{
        index: 0,
        intervalID: -1,
        statusMsg: ''
    },

    onDestroy() {
        this.clearTimer();
    },

    startInterval() {
        this.index = 0;
        if (this.intervalID !== -1) {
            clearInterval(this.intervalID);
        }
        try {
            this.intervalID = setInterval(function() {
                this.index = this.index + 1;
            }.bind(this), 1000);
            this.statusMsg = 'running';
        } catch (e) {
            console.error('error: ' + e);
            this.statusMsg = 'error: ' + e;
        }
    },

    clearTimer() {
        clearInterval(this.intervalID);
        this.statusMsg = 'cleared';
    },

    helpClicked() {
        getApp().data.helpData = { step: 'startInterval、clearInterval', result: '每1s数字加1，clearInterval时停止', url: 'pages/ArkUI/timer/interval/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['api_timer_interval'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['api_timer_interval'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
