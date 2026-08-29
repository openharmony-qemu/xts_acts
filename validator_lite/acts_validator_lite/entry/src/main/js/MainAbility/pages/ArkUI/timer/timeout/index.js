import router from '@system.router';

export default {
    data:{
        value:'show',
        timeoutId: -1,
        statusMsg: ''
    },
    startTimer() {
        this.value = 'show';
        if (this.timeoutId !== -1) {
            clearTimeout(this.timeoutId);
        }
        try {
            this.timeoutId = setTimeout(function() {
                this.value = 'once_timer success';
                this.statusMsg = 'timer fired';
            }.bind(this), 3000);
            this.statusMsg = 'waiting 3s...';
        } catch (e) {
            console.error('error: ' + e);
            this.statusMsg = 'error: ' + e;
        }
    },

    clearTimer() {
        clearTimeout(this.timeoutId);
        this.statusMsg = 'cleared';
    },

    onDestroy() {
        clearTimeout(this.timeoutId);
    },

    helpClicked() {
        getApp().data.helpData = { step: 'startTimer、clearTimer', result: '3s后show变成success，clearTimer时停止变化', url: 'pages/ArkUI/timer/timeout/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['api_timer_timeout'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['api_timer_timeout'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
