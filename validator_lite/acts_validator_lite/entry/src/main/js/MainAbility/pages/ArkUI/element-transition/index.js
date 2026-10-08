import router from '@system.router';

export default {
    data: {
        fadeShow: 'a',
        slideLShow: 'a',
        slideRShow: 'a',
        slideUShow: 'a',
        slideDShow: 'a',
        scaleShow: 'a',
        sharedShow: 'a'
    },

    onInit() {
        console.info('element-transition onInit');
    },

    getItem() {
        return getApp().data.testItems.element_transition;
    },

    recordError(msg) {
        this.getItem().errorDetail = msg;
        console.info('element-transition error: ' + msg);
    },

    // 约定：必须先调用 startTransition，成功后再更新状态变量；
    // 面板可见性由转场引擎统一落地，JS 状态仅作记录，不驱动视图
    switchDual(showKey, stageRef, aRef, bRef) {
        const next = (this[showKey] === 'a') ? 'b' : 'a';
        try {
            const incomingRef = (next === 'a') ? aRef : bRef;
            const incoming = this.$refs[incomingRef];
            this.$refs[stageRef].startTransition(incoming);
            this[showKey] = next;
        } catch (e) {
            this.recordError(showKey + ' startTransition error: ' + e);
        }
    },

    switchFade() {
        this.switchDual('fadeShow', 'fadeStage', 'fadeA', 'fadeB');
    },
    switchSlideLeft() {
        this.switchDual('slideLShow', 'slideLStage', 'slideLA', 'slideLB');
    },
    switchSlideRight() {
        this.switchDual('slideRShow', 'slideRStage', 'slideRA', 'slideRB');
    },
    switchSlideUp() {
        this.switchDual('slideUShow', 'slideUStage', 'slideUA', 'slideUB');
    },
    switchSlideDown() {
        this.switchDual('slideDShow', 'slideDStage', 'slideDA', 'slideDB');
    },
    switchScale() {
        this.switchDual('scaleShow', 'scaleStage', 'scaleA', 'scaleB');
    },

    switchShared() {
        const rectA = { x: 30, y: 30, w: 40, h: 40 };
        const rectB = { x: 130, y: 20, w: 80, h: 80 };
        const toB = (this.sharedShow === 'a');
        try {
            this.$refs.sharedStage.startTransition({
                incoming: this.$refs[toB ? 'sharedB' : 'sharedA'],
                sharedElement: this.$refs.sharedStar,
                sharedStartRect: toB ? rectA : rectB,
                sharedEndRect: toB ? rectB : rectA
            });
            this.sharedShow = toB ? 'b' : 'a';
        } catch (e) {
            this.recordError('sharedShow startTransition error: ' + e);
        }
    },

    passClicked() {
        this.getItem().status = 'pass';
        this.back();
    },
    failClicked() {
        this.getItem().status = 'fail';
        this.back();
    },
    helpClicked() {
        getApp().data.helpData = {
            step: '1) 依次点击每个 Switch 按钮。\n2) 观察 A/B 色块是否出现平滑转场动画（不应瞬间切换）。\n3) 共享元素用例注意黄色星形是否伴随移动/缩放。\n4) 若全部 7 种效果都有动画则点 Pass，否则点 Fail。',
            result: '淡入淡出、左滑、右滑、上滑、下滑、缩放和共享元素均应出现可见转场动画，无跳变或卡顿。',
            url: 'pages/ArkUI/element-transition/index'
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
