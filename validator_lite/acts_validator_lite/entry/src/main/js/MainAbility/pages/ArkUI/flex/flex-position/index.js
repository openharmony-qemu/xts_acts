import router from '@system.router';

export default {
    data: {
        title: 'flex position'
    },
    onInit() {
        console.info('flex position onInit');
    },
    passClicked() {
        getApp().data.testItems['flex_position'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['flex_position'].status = 'fail';
        this.back();
    },
    helpClicked() {
        getApp().data.helpData = {
            step: '观察蓝色 absolute 祖先容器内的四个角标',
            result: '四个 absolute 子元素分别贴合祖先容器的左上(TL)、右上(TR)、左下(BL)、右下(BR)四角；' +
                    '祖先容器自身为 absolute 且无定位祖先，回退到初始包含块（页面根）按 left/right 各 8%、top:130 定位，水平居中',
            url: 'pages/ArkUI/flex/flex-position/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    backClicked() {
        this.back();
    }
};
