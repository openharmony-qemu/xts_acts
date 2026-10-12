import router from '@system.router';

export default {
    data: {
        title: 'flex gap',
        sc1: true,
        sc2: false,
        sc3: false,
        sc4: false,
        sc5: false,
        sc6: false,
        sc7: false,
        sc8: false,
        sc9: false,
        sc10: false,
        sc11: false,

        gap1: '0px',
        status1: 'gap: 0px',

        gap2: '0px',
        status2: 'gap: 0px',

        colGap3: '0px',
        status3: 'column-gap: 0px',

        colGap4: '0px',
        status4: 'column-gap: 0px',

        gap5: '0px',
        status5: 'gap: 0px',

        rowGap6: '0px',
        status6: 'row-gap: 0px',

        rowGap9: '0px',
        status9: 'row-gap: 0px; flex-wrap: wrap',

        gap10: '0px',
        status10: 'gap: 0px',

        gap11: '0px',
        status11: 'gap: 0px'
    },
    onInit() {
        console.info('flex gap onInit');
    },
    passClicked() {
        getApp().data.testItems['flex_gap'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['flex_gap'].status = 'fail';
        this.back();
    },
    helpClicked() {
        getApp().data.helpData = {
            step: '点击数字按钮切换场景，再点场景内按钮改变 gap/row-gap/column-gap 取值，观察子项间距变化',
            result: '间距与预期描述一致：20px 时 B x=70/C x=140；负值按 0 处理；百分比按容器对应轴尺寸计算',
            url: 'pages/ArkUI/flex/flex-gap/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    backClicked() {
        this.back();
    },

    // 场景切换
    selectScenario(n) {
        for (let i = 1; i <= 11; i++) {
            this['sc' + i] = (i === n);
        }
    },
    goScenario1() { this.selectScenario(1); },
    goScenario2() { this.selectScenario(2); },
    goScenario3() { this.selectScenario(3); },
    goScenario4() { this.selectScenario(4); },
    goScenario5() { this.selectScenario(5); },
    goScenario6() { this.selectScenario(6); },
    goScenario9() { this.selectScenario(9); },
    goScenario10() { this.selectScenario(10); },
    goScenario11() { this.selectScenario(11); },

    // 1. gap 单值（TC-01/14/15）
    setGap1To0() {
        this.gap1 = '0px';
        this.status1 = 'gap: 0px';
    },
    setGap1To20() {
        this.gap1 = '20px';
        this.status1 = 'gap: 20px';
    },
    setGap1ToNeg10() {
        this.gap1 = '-10px';
        this.status1 = 'gap: -10px';
    },

    // 2. gap 双值简写（TC-02/08）
    setGap2To0() {
        this.gap2 = '0px';
        this.status2 = 'gap: 0px';
    },
    setGap2To15And5() {
        this.gap2 = '15px 5px';
        this.status2 = 'gap: 15px 5px (row-gap column-gap)';
    },

    // 3. column-gap 独立（TC-03）
    setColGap3To0() {
        this.colGap3 = '0px';
        this.status3 = 'column-gap: 0px';
    },
    setColGap3To30() {
        this.colGap3 = '30px';
        this.status3 = 'column-gap: 30px';
    },

    // 4. column-gap 10%
    setColGap4To0() {
        this.colGap4 = '0px';
        this.status4 = 'column-gap: 0px';
    },
    setColGap4To10Pct() {
        this.colGap4 = '10%';
        this.status4 = 'column-gap: 10%';
    },

    // 5. gap + flex-wrap 多行（TC-05/07）
    setGap5To0() {
        this.gap5 = '0px';
        this.status5 = 'gap: 0px';
    },
    setGap5To10() {
        this.gap5 = '10px';
        this.status5 = 'gap: 10px';
    },

    // 6. row-gap 10%
    setRowGap6To0() {
        this.rowGap6 = '0px';
        this.status6 = 'row-gap: 0px';
    },
    setRowGap6To10Pct() {
        this.rowGap6 = '10%';
        this.status6 = 'row-gap: 10%';
    },

    // 9. row-gap（wrap）：行与行之间相隔指定高度
    setRowGap9To0() {
        this.rowGap9 = '0px';
        this.status9 = 'row-gap: 0px; flex-wrap: wrap';
    },
    setRowGap9To15() {
        this.rowGap9 = '15px';
        this.status9 = 'row-gap: 15px; flex-wrap: wrap';
    },
    setRowGap9To30() {
        this.rowGap9 = '30px';
        this.status9 = 'row-gap: 30px; flex-wrap: wrap';
    },

    // 10. gap 单值 10%（百分比）
    setGap10To0() {
        this.gap10 = '0px';
        this.status10 = 'gap: 0px';
    },
    setGap10To10Pct() {
        this.gap10 = '10%';
        this.status10 = 'gap: 10%（容器 200×160）';
    },

    // 11. gap 双值 20% 50%（百分比）
    setGap11To0() {
        this.gap11 = '0px';
        this.status11 = 'gap: 0px';
    },
    setGap11To20And50() {
        this.gap11 = '20% 50%';
        this.status11 = 'gap: 20% 50% (row-gap column-gap)';
    },
    setGap11To20pxAnd50() {
        this.gap11 = '20px 50%';
        this.status11 = 'gap: 20px 50% (row-gap column-gap)';
    }
};
