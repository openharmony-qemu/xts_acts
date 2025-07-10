/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import { Decimal, Deque } from '@kit.ArkTS';
import Utils from '../Util.test';
import { BusinessError } from '@ohos.base';

let n: Decimal = new Decimal(1);

function test_hypot_001(a: string, b: string, pr: number, rm: number, expected: string) {
  Decimal.set({ precision: pr, rounding: rm });
  expect(expected).assertEqual(Decimal.hypot(a, b).valueOf());
}

function test_isFinite_001(actual: boolean) {
  expect(actual).assertTrue();
}

function test_ln_001(n: string, expected: string, sd: number, rm: number) {
  Decimal.set({ precision: sd, rounding: rm });
  expect(expected).assertEqual(Decimal.ln(n).valueOf());
}

function test_floor_001(expected: string, n: number) {
  expect(expected).assertEqual(Decimal.floor(n).valueOf());
}

function test_floor_002(expected: string, n: string) {
  expect(expected).assertEqual(Decimal.floor(n).valueOf());
}

export default function Decimal4Test() {
  describe('Decimal4Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      afterEach(() => {
        await Utils.msSleep(100)
      })
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    : DECIMAL_TEST5_001
     * @tc.name      : Decimal_hypot_Func_001
     * @tc.desc      : Test hypot
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_hypot_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Decimal.set({
        precision: 40,
        rounding: 4,
        toExpNeg: -9e15,
        toExpPos: 9e15,
        minE: -9e15,
        maxE: 9e15
      });
      test_hypot_001('1', 'NaN', 20, 4, 'NaN');
      test_hypot_001('NaN', '1', 20, 4, 'NaN');
      test_hypot_001('Infinity', 'NaN', 20, 4, 'Infinity');
      test_hypot_001('NaN', '-Infinity', 20, 4, 'Infinity');
      test_hypot_001('Infinity', '-9', 20, 4, 'Infinity');
      test_hypot_001('9', 'Infinity', 20, 4, 'Infinity');
      test_hypot_001('9', '-Infinity', 20, 4, 'Infinity');
      test_hypot_001('0', '0', 20, 4, '0');
      test_hypot_001('0', '-0', 20, 4, '0');
      test_hypot_001('-0', '-0', 20, 4, '0');
      test_hypot_001('-73859972487135996812.3348849386076204815086183608621433996131', '-40900275', 92, 4,
        '73859972487135996812.334896262958542538634842711692934521304033086425417371740907212824629036');
      test_hypot_001('87777821928367383886207001990043726894046439498880958101', '13100000', 53, 2,
        '87777821928367383886207001990043726894046439498880959000');
      test_hypot_001('-9068023035566545177890098186515752036653463863403529285431568942304.1209958989782427940509418772899870623734',
        '2666666666666.6666666666662666666666666666666666666666766666466666666666666666666666666668', 93, 5,
        '9068023035566545177890098186515752036653463863403529285431568942304.12099589897824279405094188');
      test_hypot_001('-19.8731062176484', '-631970.6', 60, 0,
        '631970.600312467344715323508497215861344293021711284138304041');
      test_hypot_001('-1111111111111141067315396649709360127244075372005400124355334298632449424416463580266666666666',
        '-0.0000000015372402412953773290762250418563358319557966420343267849914304381916024954828959476537495440147246975615343391',
        43, 0, '1111111111111141067315396649709360127244076000000000000000000000000000000000000000000000000000');
      test_hypot_001('-0.983064721909232202799884070088', '-1888888888888371106396282947223787931710', 20, 4,
        '1888888888888371106400000000000000000000');
      test_hypot_001('861123450449582222', '-3268941330032700177909698138482', 73, 1,
        '3268941330032700177909698251903.062363755594001549793838456512462423760753');
      test_hypot_001('-1.759', '-0.1666933060407184714285777825813947232316520181597980844428', 8, 3, '1.7668807');
      test_hypot_001('0.1852451289933636289285652675346736246965605',
        '-48506.827382527105658688770367877324273166861983575641312454026244237512829473955620223096782936193504746',
        48, 2, '48506.8273828808265642535390473175215096921677017');

    });
    /**
     * @tc.number    : DECIMAL_TEST5_002
     * @tc.name      : Decimal_hypot_Func_002
     * @tc.desc      : Test hypot
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_hypot_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_hypot_001('-3000008000000000000000070000000000000000000001000000000000.000000000000002000000000000000000900000000010002',
        '-802.661566839437264337325468337423185084', 22, 0,
        '3000008000000000000001000000000000000000000000000000000000');
      test_hypot_001('-8', '-5482493793', 53, 2, '5482493793.0000000058367599140481142689669647662254134');
      test_hypot_001('4111111111111111.11111111111611110111171111811111111611',
        '-0.7801745669150266383906952786894096943691775116027', 26, 1, '4111111111111111.1111111111');
      test_hypot_001('4649136268549586431953848205459087026588854116776105905', '-0.4538997053719724982993', 76, 4,
        '4649136268549586431953848205459087026588854116776105905');
      test_hypot_001('-711281636404745616773671624856748035918060782119438', '0.6011202051617683354856452418581', 80, 0,
        '711281636404745616773671624856748035918060782119438.00000000000000000000000000001');
      test_hypot_001('-55102601.0381', '-5160591', 93, 5,
        '55343729.0091054507509667515051408897750996134016431347788775107555545851579689419350413225929');
      test_hypot_001('183', '0.6', 22, 3, '183.0009836039139981977');
      test_hypot_001('4000000000080000000000000000000000', '0.55', 82, 0,
        '4000000000080000000000000000000000.000000000000000000000000000000000037812499999244');
      test_hypot_001('-0.55', '-9000000.000000000000000000000000000000000000000000000000000000000000000000000000000009',
        62, 1, '9000000.0000000168055555555555398651834705075738799986293162621');
      test_hypot_001('-0.388099754174217471056249565014913560596333083573199500992', '0.0000363576265205', 75, 0,
        '0.388099755877229375967849346839104152672911497025034368058113842991365933724');
      test_hypot_001('52222222222227378067480110037255168691979179742111111111',
        '-867069820.333078943531805179108670644728376893549909696519412570032111919516568762799', 7, 2,
        '52222230000000000000000000000000000000000000000000000000');
      test_hypot_001('-8.0898982865397951925970316274645291728205275567128', '-0.0000945902', 28, 6,
        '8.089898287092787678956284349');
      test_hypot_001('-1664553204017852793900913959927482283751', '-933333388888.15884290172642527', 32, 1,
        '1664553204017852793900913959927400000000');
      test_hypot_001('-0.09771882084', '-8', 41, 2, '8.000596788236885020873363221344096704335');
      test_hypot_001('-10.11111111545', '-0.306711465294651568375461540673418284608909142237604855', 98, 2,
        '10.11576195409518993106696772029199668325921193685867908705991646038726063827463162781415087647978');
      test_hypot_001('-4437098359999999999993.9999', '-0.2241991', 56, 3,
        '4437098359999999999993.9999000000000000000000056642012823');
      test_hypot_001('901390573372408932467350822015112608121945120543338853670905789705602623427861.103187236210204922562771581943724285507586728737018434159395',
        '-23333333333333333351020223106390010419253302605986582847591694927992733993338709578970900366475156635422035555555',
        18, 0,
        '23333333333333333400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
    })

    /**
     * @tc.number    : DECIMAL_TEST5_003
     * @tc.name      : Decimal_hypot_Func_003
     * @tc.desc      : Test hypot
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_hypot_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Decimal.set({
        precision: 40,
        rounding: 4,
        toExpNeg: -9e15,
        toExpPos: 9e15,
        minE: -9e15,
        maxE: 9e15
      });
      test_hypot_001('19999999999999999999999999999999.919999999999999999999',
        '-95670705629746263190920599520452475212900072593749902459133558626394349560336068069498100861613875411', 24, 6,
        '95670705629746263190920600000000000000000000000000000000000000000000000000000000000000000000000000000');
      test_hypot_001('459.273', '9638369683361034.552409', 63, 5,
        '9638369683361034.55240900001094229083644388522937457239375956406');
      test_hypot_001('19333333333.33313333333333', '-307058050750', 19, 4, '307666092230.143791');
      test_hypot_001('-4888.8813611', '61856704783261924843882364363459938129336598998376', 35, 6,
        '61856704783261924843882364363459938000000000000000');
      test_hypot_001('-90316963180999999999997999999999999.99999999999999959999999999999999999999999999999',
        '-899997034414865629076187032', 24, 0, '90316963181000004484176000000000000');
      test_hypot_001('-0.00001175529004148059889839195560772120687431522218537528816456748920635963047412762382567334499074596992570830887179621917584255805343012605460010989845894713567382571024',
        '59.8600988774488317444932', 22, 1, '59.86009887744998599287');
      test_hypot_001('-844444444444445105013379803702088715444444.44444444',
        '851735648360163016915210118100049528358186144013411569', 13, 2,
        '851735648360200000000000000000000000000000000000000000');
      test_hypot_001('-0.1098958603115877986399807307790849607335424187223724689574921530969578406825061416021390586394788741395795498746592063682753064315701974886',
        '-52222222222222262283923266176757777', 76, 5,
        '52222222222222262283923266176757777.00000000000000000000000000000000000011563');
      test_hypot_001('-10027999242546642659855555555555', '-703.824', 25, 3, '10027999242546642659855550000000');
      test_hypot_001('-17118682794143106193517128.496346472179213795',
        '19999999999999999997919330.00231406838630646574151545822388888888888888888', 38, 5,
        '26325829533112365449334045.441841092728');
      test_hypot_001('0.465596788868', '-9431769081', 29, 3, '9431769081.0000000000114920312');
      test_hypot_001('-587359.66395', '-0.49568003707000085674015751654640980033', 13, 5, '587359.6639502');
      test_hypot_001('-0.059956811106228018570509499080322651692489744383276282735', '0.7728191', 54, 5,
        '0.775141393890713275121528253795513914835075182802874717');
      test_hypot_001('2222215171676429123638899593785648371510606061543680191659124444444444.6906517318485520720388589138008481347302123923691909983086306231440651',
        '788888.888888885011536108582122208072284443333', 80, 6,
        '2222215171676429123638899593785648371510606061543680191659124444444444.6906517318');
      test_hypot_001('70000000000000010000000000006.100000000000004',
        '-78957772777.77777777777777777777777777777777777777277771777777777777', 1, 0, '80000000000000000000000000000');
      test_hypot_001('-41720000000020000000000000000000000000000000000000000700000000000000600000004000000001000000000000060000000000.00080000000000000006',
        '-46835015.87548144758089751035240583513', 34, 6,
        '41720000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
      test_hypot_001('28666666666666666666666676666666666666666666666666616666666666666666666.6663666666666666666666666666666666666666666666666664666666666666666666',
        '-7.8461', 56, 4, '28666666666666666666666676666666666666666666666666616667000000000000000');
      test_hypot_001('0.6', '-91.5250722217761303', 63, 0,
        '91.5270388748665715095625471128327141160527733302883072128489811');
      test_hypot_001('30000.6',
        '511111111111145686553087261381.999991267342292294981021024064788686134890483114665388298481703', 51, 2,
        '511111111111145686553087261381.999991267342292294982');
    })

    /**
     * @tc.number    : DECIMAL_TEST5_004
     * @tc.name      : Decimal_hypot_Func_004
     * @tc.desc      : Test hypot
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_hypot_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_hypot_001('72926343.726877231000712798686463998173070827809981833334964558342793176683041794308836271',
        '-82222222222221937444', 49, 2, '82222222222221937444.00003234071924617295968730272');
      test_hypot_001('-242915822316177763142341053724.3195904798466883740740090079450439',
        '-299999999999.999999999999999999995999999999999999999999999999990999994', 51, 2,
        '242915822316177763142341053724.319590665096045830207');
      test_hypot_001('-306555555555555555555555055555555555555555555555555555559555555555555555555555555555555555555555555555555595555555555555555555555555555555555555555555525555555555555555555555555555555.5555555555',
        '0.15666773914679673976142669430328125908359330664846715765297103124831482667541495', 15, 3,
        '306555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
      test_hypot_001('-5734991.83220402694035812590544522858837047993475498775680667010453187699606727653014592756227908536357219129844096200521',
        '99399999.699', 55, 0, '99565305.56110721338952690556051338361260372609898394192');
      test_hypot_001('-0.585223', '9742275700501', 25, 1, '9742275700501');
      test_hypot_001('-817', '2706343113769608709474153626083514693465686442858333333333333333', 54, 2,
        '2706343113769608709474153626083514693465686442858333340000000000');
      test_hypot_001('521999999999199999929999999999999999.99999995999999',
        '-6777777777777777777777777.777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777770777777775',
        54, 2, '521999999999199999930044002175866866.547023411749520706');
      test_hypot_001('-4516475899411196.1710280841858351554959449', '0.00362', 26, 2, '4516475899411196.1710280842');
      test_hypot_001('79996999999999999999999999999999999999999999999.999999999999999999299999999999999599999999999999999996',
        '0.000000006393873924327515206665863616080266830154605167288849831012562983901', 32, 3,
        '79996999999999999999999999999999000000000000000');
      test_hypot_001('165014180635256662053.5623866609995456978976014664', '126847933143118145017958510547081.01687771',
        82, 2, '126847933143118145017958617879061.6649297630723081683143413440383325550496316428679');
      test_hypot_001('4444444444.44444444444444444444444444444444444444444444',
        '0.0000390055319967605996065972540356157510147289248305250742502606', 19, 5, '4444444444.444444444');
      test_hypot_001('-8905370954396883647914407290800692779839518281513035906502493568844696561439275153317671748655256327646885877826948402873397232451',
        '0.000000002433575166551955655019349462492613256751863629697572595342683572506451544556497587139362820461701547049759568493058791704546964632763776550260691',
        95, 6,
        '8905370954396883647914407290800692779839518281513035906502493568844696561439275153317671748655300000000000000000000000000000000000');
      test_hypot_001('700000000', '0.10532749524343436', 67, 4,
        '700000000.0000000000079242008958969198076099247634079046096355599626');
      test_hypot_001('9555555555555555555555555555555555555555.55555555555555555555555555555555555555555',
        '757773470777777777787727.7777777777777747777', 34, 5, '9555555555555555555555555555555586000000');
      test_hypot_001('-0.297233184499378290751031871',
        '94444444444450932925402136569369568252675313623114112449951937227491', 57, 4,
        '94444444444450932925402136569369568252675313623114112450000000000000');
      test_hypot_001('706.6640602786138076271815698607630793709065809977913853658899180593912800991919896234768331533404376463838897508518404177667748',
        '589272858', 76, 5, '589272858.0004237205967572977795909916847730224498576503592425079948021269944');
    })

    /**
     * @tc.number    : DECIMAL_TEST5_005
     * @tc.name      : Decimal_hypot_Func_005
     * @tc.desc      : Test hypot
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_hypot_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Decimal.set({
        precision: 40,
        rounding: 4,
        toExpNeg: -9e15,
        toExpPos: 9e15,
        minE: -9e15,
        maxE: 9e15
      });
      test_hypot_001('141421829337978396523958245492.356577241347882862045',
        '-0.0000009062726880615943999813266035730355189554501814541380840728', 17, 3, '141421829337978390000000000000');
      test_hypot_001('288888418696038361803537630426270.71151743887471708693463333333333333',
        '-81195599558835246729685688119938533071101', 8, 4, '81195600000000000000000000000000000000000');
      test_hypot_001('382666666.66666666666', '-310.351', 17, 2, '382666666.66679252');
      test_hypot_001('509146', '27974901', 27, 1, '27979533.8704760590941855702');
      test_hypot_001('600075881745331917265194619524368592248337558828411479126381966442789',
        '-199999999959999999999999999999999999999999999999.9999999999999999999999999999999999999999999999999999', 68, 5,
        '600075881745331917265194619524368592248337592157529679693993900861880');
      test_hypot_001('33333333333333333333933.333', '92675418847792981854934.77651107680859649467120073', 26, 2,
        '98487787921777255092429.556');
      test_hypot_001('-194.04494819612983', '87934613325863285610318426691747541751704168685', 55, 3,
        '87934613325863285610318426691747541751704168685');
      test_hypot_001('-0.00006', '-9108555555555555755555555555555555555555555555.555855555555565555555555585555555',
        69, 5, '9108555555555555755555555555555555555555555555.55585555555556555555556');
      test_hypot_001('-1867112.3', '-7443151922333351621784797114283077371961143985830384399', 98, 2,
        '7443151922333351621784797114283077371961143985830384399.0000000000000000000000000000000000000000003');
      test_hypot_001('0.640650325', '8337529018416437', 88, 1,
        '8337529018416437.000000000000000024613577836791740925174427714878489185918199187020262415');
      test_hypot_001('-7.0711298394245347979492394379496305607768672891309791',
        '-92.5549672712666393257898900443199898401181108080123982312500316214214726463524089322636338782070900725995605695513761536504989976346266550486346671844299550305743931825324317787',
        26, 5, '92.824688762156584043556536');
      test_hypot_001('11.000500000000070000000000000000515', '-928864249591777933822222222', 69, 4,
        '928864249591777933822222222.000000000000000000000000065139227989011355');
      test_hypot_001('8.9929999999999999999999999999',
        '-94444444444444.7777777777777777777444449232900948624986161628952947337337208243', 100, 0,
        '94444444444444.77777777777820593447444492177895346249764146644605457433165778719182374051141272166291');
    })

    /**
     * @tc.number    : DECIMAL_TEST5_006
     * @tc.name      : Decimal_hypot_Func_006
     * @tc.desc      : Test hypot
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_hypot_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_hypot_001('-3', '8000000000', 48, 6, '8000000000.00000000056249999999999999998022460938');
      test_hypot_001('524224294278833258504244689131128804963',
        '-0.1964918169532600262422065880715612530725541194753716933743653473301573055', 92, 0,
        '524224294278833258504244689131128804963.00000000000000000000000000000000000000003682491879045');
      test_hypot_001('-5563710.400490441356383129065751744241271474147187007959891690143773431654594134378',
        '234644300000000000.86356426586528430874003818', 73, 4,
        '234644300000000000.8636302271381993667815855570906197025798452968278931064');
      test_hypot_001('0.005336508972581768759465256138116638362412237071722728683544001', '-2744818576', 62, 5,
        '2744818576.0000000000000051876521573143355893278038250258951491');
      test_hypot_001('6100958683940338086146995110755471006768600255866666666666666666', '95009361293210581532023714',
        96, 2, '6100958683940338086146995110755471006768600255866666666666666666.00000000000073978363081733130453');
      test_hypot_001('4948457219440599111007826250603151703105812225460181157894774181631869',
        '-500000000050000000000000000000000000.7000000000600000000000000000000000000000000005', 23, 0,
        '4948457219440599111007900000000000000000000000000000000000000000000000');
      test_hypot_001('0.000000002979', '-9', 43, 1, '9.000000000000000000493024499999999999986495');
      test_hypot_001('0.47555305129875312820342601735', '-0.2673085693', 12, 0, '0.545531461807');
      test_hypot_001('3290866969805582657729329868.97622844503712282586503',
        '8996300581562651076861828923126756911315531038131347433298', 26, 5,
        '8996300581562651076861828900000000000000000000000000000000');
      test_hypot_001('-95721335544.654143365002196', '-1822222', 96, 1,
        '95721335561.9987248947602645712748098096888624484242375216519098735810157428711542690977103766782');
      test_hypot_001('0.974893703406145670332688066323452747831483011640048285105884619867888725281346574205291151337004770627960177971',
        '0.000239596749', 4, 6, '0.9749');
      test_hypot_001('-0.00012856579', '-21536540290437517549950.6925', 13, 0, '21536540290440000000000');
      test_hypot_001('6300828.297308463126', '-555138043489683551066925156982819307', 3, 4,
        '555000000000000000000000000000000000');
      test_hypot_001('0.4519719010451812700381881242155284703426402593258190987',
        '92346327717009585478189395590602.34545881237122995324639951758026247635570631069180557087', 55, 4,
        '92346327717009585478189395590602.3454588123712299532464');
      test_hypot_001('69398002688216703269792743800286307271116693445111111111111111',
        '-211393667179764005100083390018873694', 100, 0,
        '69398002688216703269792743800286307271116693445111111433074862.06409526630410784634920186057594444197');
      test_hypot_001('0.19', '-5288.143883', 42, 3, '5288.14388641329593020355143132324946951485');
    })
    /**
     * @tc.number    : DECIMAL_TEST5_007
     * @tc.name      : Decimal_hypot_Func_007
     * @tc.desc      : Test hypot
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_hypot_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Decimal.set({
        precision: 40,
        rounding: 4,
        toExpNeg: -9e15,
        toExpPos: 9e15,
        minE: -9e15,
        maxE: 9e15
      });
      try {
        test_hypot_001('e', 'e', 20, 4, 'NaN');
        expect(true).assertEqual(false);
      } catch (err: BusinessError) {
        expect(err.name).assertEqual(`BusinessError`);
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual(`The type of "test(str)" must be Hex/Binary/Octal. Received value is: e`);
      }
    });

    /**
     * @tc.number    : DECIMAL_TEST5_008
     * @tc.name      : Decimal_hypot_Func_008
     * @tc.desc      : Test hypot
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_hypot_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Decimal.set({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15
      });
      n = new Decimal(1);
      test_isFinite_001(n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(!n.isNegative());
      test_isFinite_001(!n.isZero());
      test_isFinite_001(n.isInteger());
      test_isFinite_001(n.equals(n));
      test_isFinite_001(n.equals(1));
      test_isFinite_001(n.equals('1.0'));
      test_isFinite_001(n.equals('1.00'));
      test_isFinite_001(n.equals('1.000'));
      test_isFinite_001(n.equals('1.0000'));
      test_isFinite_001(n.equals('1.00000'));
      test_isFinite_001(n.equals('1.000000'));
      test_isFinite_001(n.equals(new Decimal(1)));
      test_isFinite_001(n.equals('0x1'));
    })
    /**
     * @tc.number    : DECIMAL_TEST5_008
     * @tc.name      : Decimal_isFinite_Func_008
     * @tc.desc      : Test isFinite
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_isFinite_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_isFinite_001(n.equals('0o1'));
      test_isFinite_001(n.equals('0b1'));
      test_isFinite_001(n.greaterThan(0.99999));
      test_isFinite_001(!n.greaterThanOrEqualTo(1.1));
      test_isFinite_001(n.lessThan(1.001));
      test_isFinite_001(n.lessThanOrEqualTo(2));
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal('-0.1');
      test_isFinite_001(n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(n.isNegative());
      test_isFinite_001(!n.isZero());
      test_isFinite_001(!n.isInteger());
      test_isFinite_001(!n.equals(0.1));
      test_isFinite_001(!n.greaterThan(-0.1));
      test_isFinite_001(n.greaterThanOrEqualTo(-1));
      test_isFinite_001(n.lessThan(-0.01));
      test_isFinite_001(!n.lessThanOrEqualTo(-1));
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal(Infinity);
      test_isFinite_001(!n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(!n.isNegative());
      test_isFinite_001(!n.isZero());
      test_isFinite_001(!n.isInteger());
      test_isFinite_001(n.equals('Infinity'));
      test_isFinite_001(n.equals(1 / 0.0));
      test_isFinite_001(n.greaterThan('9e999'));
    })
    /**
     * @tc.number    : DECIMAL_TEST5_009
     * @tc.name      : Decimal_isFinite_Func_009
     * @tc.desc      : Test isFinite
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_isFinite_Func_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_isFinite_001(n.greaterThanOrEqualTo(Infinity));
      test_isFinite_001(!n.lessThan(Infinity));
      test_isFinite_001(n.lessThanOrEqualTo(Infinity));
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal('-Infinity');
      test_isFinite_001(!n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(n.isNegative());
      test_isFinite_001(!n.isZero());
      test_isFinite_001(!n.isInteger());
      test_isFinite_001(!n.equals(Infinity));
      test_isFinite_001(n.equals(-1 / 0.0));
      test_isFinite_001(!n.greaterThan(-Infinity));
      test_isFinite_001(n.lessThan(0));
      test_isFinite_001(n.lessThanOrEqualTo(Infinity));
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal('0.0000000');
      test_isFinite_001(n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(!n.isNegative());
      test_isFinite_001(n.isZero());
      test_isFinite_001(n.isInteger());
      test_isFinite_001(n.equals(-0));
    })
    /**
     * @tc.number    : DECIMAL_TEST5_010
     * @tc.name      : Decimal_isFinite_Func_010
     * @tc.desc      : Test isFinite
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_isFinite_Func_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_isFinite_001(n.greaterThan(-0.000001));
      test_isFinite_001(!n.greaterThanOrEqualTo(0.1));
      test_isFinite_001(n.lessThan(0.0001));
      test_isFinite_001(n.lessThanOrEqualTo(-0));
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal(-0);
      test_isFinite_001(n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(n.isNegative());
      test_isFinite_001(n.isZero());
      test_isFinite_001(n.isInteger());
      test_isFinite_001(n.equals('0.000'));
      test_isFinite_001(n.greaterThan(-1));
      test_isFinite_001(!n.greaterThanOrEqualTo(0.1));
      test_isFinite_001(!n.lessThan(0));
      test_isFinite_001(n.lessThan(0.1));
      test_isFinite_001(n.lessThanOrEqualTo(0));
      test_isFinite_001(n.valueOf() === '-0' && n.toString() === '0');
      n = new Decimal('NaN');
      test_isFinite_001(!n.isFinite());
      test_isFinite_001(n.isNaN());
    })
    /**
     * @tc.number    : DECIMAL_TEST5_011
     * @tc.name      : Decimal_isFinite_Func_011
     * @tc.desc      : Test isFinite
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_isFinite_Func_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_isFinite_001(!n.isNegative());
      test_isFinite_001(!n.isZero());
      test_isFinite_001(!n.isInteger());
      test_isFinite_001(!n.equals(NaN));
      test_isFinite_001(!n.equals(Infinity));
      test_isFinite_001(!n.greaterThan(0));
      test_isFinite_001(!n.greaterThanOrEqualTo(0));
      test_isFinite_001(!n.lessThan(1));
      test_isFinite_001(!n.lessThanOrEqualTo(-0));
      test_isFinite_001(!n.lessThanOrEqualTo(-1));
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal('-1.234e+2');
      test_isFinite_001(n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(n.isNegative());
      test_isFinite_001(!n.isZero());
      test_isFinite_001(!n.isInteger());
      test_isFinite_001(n.equals(-123.4));
      test_isFinite_001(n.greaterThan('-0xff'));
      test_isFinite_001(n.greaterThanOrEqualTo('-1.234e+3'));
      test_isFinite_001(n.lessThan(-123.39999));
      test_isFinite_001(n.lessThanOrEqualTo('-123.4e+0'));
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal('5e-200');
      test_isFinite_001(n.isFinite());
      test_isFinite_001(!n.isNaN());
      test_isFinite_001(!n.isNegative());
    })
    /**
     * @tc.number    : DECIMAL_TEST5_012
     * @tc.name      : Decimal_isFinite_Func_012
     * @tc.desc      : Test isFinite
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_isFinite_Func_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_isFinite_001(!n.isZero());
      test_isFinite_001(!n.isInteger());
      test_isFinite_001(n.equals(5e-200));
      test_isFinite_001(n.greaterThan(5e-201));
      test_isFinite_001(!n.greaterThanOrEqualTo(1));
      test_isFinite_001(n.lessThan(6e-200));
      test_isFinite_001(n.lessThanOrEqualTo(5.1e-200));
      test_isFinite_001(n.toString() === n.valueOf());
      n = new Decimal('1');
      test_isFinite_001(n.equals(n));
      test_isFinite_001(n.equals(n.toString()));
      test_isFinite_001(n.equals(n.toString()));
      test_isFinite_001(n.equals(n.valueOf()));
      test_isFinite_001(n.equals(n.toFixed()));
      test_isFinite_001(n.equals(1));
      test_isFinite_001(n.equals('1e+0'));
      test_isFinite_001(!n.equals(-1));
      test_isFinite_001(!n.equals(0.1));
      test_isFinite_001(!new Decimal(NaN).equals(0));
      test_isFinite_001(!new Decimal(Infinity).equals(0));
      test_isFinite_001(!new Decimal(0.1).equals(0));
      test_isFinite_001(!new Decimal(1e9 + 1).equals(1e9));
      test_isFinite_001(!new Decimal(1e9 - 1).equals(1e9));
      test_isFinite_001(new Decimal(1e9 + 1).equals(1e9 + 1));
      test_isFinite_001(new Decimal(1).equals(1));
      test_isFinite_001(!new Decimal(1).equals(-1));
      test_isFinite_001(!new Decimal(NaN).equals(NaN));
    })
    /**
     * @tc.number    : DECIMAL_TEST5_013
     * @tc.name      : Decimal_isFinite_Func_013
     * @tc.desc      : Test isFinite
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_isFinite_Func_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_isFinite_001(!new Decimal('NaN').equals('NaN'));
      test_isFinite_001(!new Decimal(NaN).greaterThan(NaN));
      test_isFinite_001(!new Decimal(NaN).lessThan(NaN));
      test_isFinite_001(new Decimal('0xa').lessThanOrEqualTo('0xff'));
      test_isFinite_001(new Decimal('0xb').greaterThanOrEqualTo('0x9'));
      test_isFinite_001(!new Decimal(10).greaterThan(10));
      test_isFinite_001(!new Decimal(10).lessThan(10));
      test_isFinite_001(!new Decimal(NaN).lessThan(NaN));
      test_isFinite_001(!new Decimal(Infinity).lessThan(-Infinity));
      test_isFinite_001(!new Decimal(Infinity).lessThan(Infinity));
      test_isFinite_001(new Decimal(Infinity).lessThanOrEqualTo(Infinity));
      test_isFinite_001(!new Decimal(NaN).greaterThanOrEqualTo(NaN));
      test_isFinite_001(new Decimal(Infinity).greaterThanOrEqualTo(Infinity));
      test_isFinite_001(new Decimal(Infinity).greaterThanOrEqualTo(-Infinity));
      test_isFinite_001(!new Decimal(NaN).greaterThanOrEqualTo(-Infinity));
      test_isFinite_001(new Decimal(-Infinity).greaterThanOrEqualTo(-Infinity));
      test_isFinite_001(!new Decimal(2).greaterThan(10));
      test_isFinite_001(!new Decimal(10).lessThan(2));
      test_isFinite_001(new Decimal(255).lessThanOrEqualTo('0xff'));
      test_isFinite_001(new Decimal('0xa').greaterThanOrEqualTo('0x9'));
      test_isFinite_001(!new Decimal(0).lessThanOrEqualTo('NaN'));
      test_isFinite_001(!new Decimal(0).greaterThanOrEqualTo(NaN));
      test_isFinite_001(!new Decimal(NaN).lessThanOrEqualTo('NaN'));
      test_isFinite_001(!new Decimal(NaN).greaterThanOrEqualTo(NaN));
      test_isFinite_001(!new Decimal(0).lessThanOrEqualTo(-Infinity));

    })
    /**
     * @tc.number    : DECIMAL_TEST5_014
     * @tc.name      : Decimal_isFinite_Func_014
     * @tc.desc      : Test isFinite
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_isFinite_Func_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_isFinite_001(new Decimal(0).greaterThanOrEqualTo(-Infinity));
      test_isFinite_001(new Decimal(0).lessThanOrEqualTo('Infinity'));
      test_isFinite_001(!new Decimal(0).greaterThanOrEqualTo('Infinity'));
      test_isFinite_001(new Decimal(10).lessThanOrEqualTo(20));
      test_isFinite_001(!new Decimal(10).greaterThanOrEqualTo(20));
      test_isFinite_001(!new Decimal(1.23001e-2).lessThan(1.23e-2));
      test_isFinite_001(new Decimal(1.23e-2).lessThan(1.23001e-2));
      test_isFinite_001(!new Decimal(1e-2).lessThan(9.999999e-3));
      test_isFinite_001(new Decimal(9.999999e-3).lessThan(1e-2));
      test_isFinite_001(!new Decimal(1.23001e+2).lessThan(1.23e+2));
      test_isFinite_001(new Decimal(1.23e+2).lessThan(1.23001e+2));
      test_isFinite_001(new Decimal(9.999999e+2).lessThan(1e+3));
      test_isFinite_001(!new Decimal(1e+3).lessThan(9.9999999e+2));
      test_isFinite_001(!new Decimal(1.23001e-2).lessThanOrEqualTo(1.23e-2));
      test_isFinite_001(new Decimal(1.23e-2).lessThanOrEqualTo(1.23001e-2));
      test_isFinite_001(!new Decimal(1e-2).lessThanOrEqualTo(9.999999e-3));
      test_isFinite_001(new Decimal(9.999999e-3).lessThanOrEqualTo(1e-2));
      test_isFinite_001(!new Decimal(1.23001e+2).lessThanOrEqualTo(1.23e+2));
      test_isFinite_001(new Decimal(1.23e+2).lessThanOrEqualTo(1.23001e+2));
    })
    /**
     * @tc.number    : DECIMAL_TEST5_009
     * @tc.name      : Decimal_isFinite_Func_009
     * @tc.desc      : Test isFinite
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_isFinite_Func_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_isFinite_001(new Decimal(9.999999e+2).lessThanOrEqualTo(1e+3));
      test_isFinite_001(!new Decimal(1e+3).lessThanOrEqualTo(9.9999999e+2));
      test_isFinite_001(new Decimal(1.23001e-2).greaterThan(1.23e-2));
      test_isFinite_001(!new Decimal(1.23e-2).greaterThan(1.23001e-2));
      test_isFinite_001(new Decimal(1e-2).greaterThan(9.999999e-3));
      test_isFinite_001(!new Decimal(9.999999e-3).greaterThan(1e-2));
      test_isFinite_001(new Decimal(1.23001e+2).greaterThan(1.23e+2));
      test_isFinite_001(!new Decimal(1.23e+2).greaterThan(1.23001e+2));
      test_isFinite_001(!new Decimal(9.999999e+2).greaterThan(1e+3));
      test_isFinite_001(new Decimal(1e+3).greaterThan(9.9999999e+2));
      test_isFinite_001(new Decimal(1.23001e-2).greaterThanOrEqualTo(1.23e-2));
      test_isFinite_001(!new Decimal(1.23e-2).greaterThanOrEqualTo(1.23001e-2));
      test_isFinite_001(new Decimal(1e-2).greaterThanOrEqualTo(9.999999e-3));
      test_isFinite_001(!new Decimal(9.999999e-3).greaterThanOrEqualTo(1e-2));
      test_isFinite_001(new Decimal(1.23001e+2).greaterThanOrEqualTo(1.23e+2));
      test_isFinite_001(!new Decimal(1.23e+2).greaterThanOrEqualTo(1.23001e+2));
      test_isFinite_001(!new Decimal(9.999999e+2).greaterThanOrEqualTo(1e+3));
      test_isFinite_001(new Decimal(1e+3).greaterThanOrEqualTo(9.9999999e+2));
      test_isFinite_001(!new Decimal('1.0000000000000000000001').isInteger());
      test_isFinite_001(!new Decimal('0.999999999999999999999').isInteger());
      test_isFinite_001(new Decimal('4e4').isInteger());
      test_isFinite_001(new Decimal('-4e4').isInteger());
    })

    /**
     * @tc.number    : DECIMAL_TEST5_015
     * @tc.name      : Decimal_ln_Func_015
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Decimal.set({
        precision: 40,
        rounding: 4,
        toExpNeg: -9e15,
        toExpPos: 9e15,
        minE: -9e15,
        maxE: 9e15
      });
      test_ln_001('0', '-Infinity', 40, 4);
      test_ln_001('0', String(Math.log(0)), 40, 4);
      test_ln_001('-0', String('-Infinity'), 40, 4);
      test_ln_001('-0', String(Math.log(-0)), 40, 4);
      test_ln_001('1', '0', 40, 4);
      test_ln_001('1', String(Math.log(1)), 40, 4);
      test_ln_001('-Infinity', 'NaN', 40, 4);
      test_ln_001('-Infinity', String(Math.log(-Infinity)), 40, 4);
      test_ln_001('Infinity', 'Infinity', 40, 4);
      test_ln_001('Infinity', String(Math.log(Infinity)), 40, 4);
      test_ln_001('NaN', 'NaN', 40, 4);
      test_ln_001('NaN', String(Math.log(NaN)), 40, 4);
      test_ln_001('2.7182818284590452353602874713526624977572', '1', 39, 4);
      test_ln_001('91247532.65728', '18.3290865106890306', 19, 1);
    })
    /**
     * @tc.number    : DECIMAL_TEST5_016
     * @tc.name      : Decimal_ln_Func_016
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('727579403.9', '20.40523369730819818291393006', 28, 3);
      test_ln_001('419065154.52076499608', '19.8535369658470908', 19, 2);
      test_ln_001('130749452.494110812', '18.68879347348', 13, 6);
      test_ln_001('1185619573.5511384009507900359', '20.89353132177529891789', 22, 0);
      test_ln_001('530465273.44', '20.089265053819159', 17, 4);
      test_ln_001('93521824.19043496087', '18.353705380823595707150211318', 29, 3);
      test_ln_001('93587439.79738005953', '18.354406742245', 14, 0);
      test_ln_001('913009834.17782778193371741', '20.63225720978034314683755252', 29, 4);
      test_ln_001('96363417.9729392663575231665', '18.3836372059508935007674191717', 30, 0);
      test_ln_001('210401674.5643546532430157', '19.1645289977522148145584372801492541489626022147443118341', 57, 3);
      test_ln_001('952417276.8651321118737418',
        '20.67451381275802954644121920485653995422386303532469652920020456933991073071', 76, 3);
      test_ln_001('142322563.253900033190831713543268828109981967888490291406527346535501984011990242137300064766425179727442507442591862989037644368590904104621357145575632132596634560836335843482822061685451360570260600926717066081883739008412790434377893984866700040372917562269733068809727985812968781985268403920729907489962116060023323078359102582924017315196797171078484331048743611378544575282691634826207',
        '18.77360661165643483904346', 25, 4);
      test_ln_001('371400293.53826507744653292410472631048281764405036030167939649508120465472946573115185753424640793913438158589233749086894500415028950753895660006551599374916249772634013307822672548085573611750200419176163913242813545244921337312493040312898991903677477383181667469789752847529551033664230833747974881304800992388176411266053764',
        '19.732790997238693', 17, 5);
      test_ln_001('308061625.88823978041274039804998186206865791141980152103127270513511076834989316028752984249313112128128502539231626511285494530858340408577571344790765131399576822101736125139886541136712372342853393859483419254236049454263746814598084065516321822244266672902276617353573868701264411419113453133557772924904083715036037838173144284202571542029689590647862395',
        '19.5', 3, 4);
      test_ln_001('56166207.244290436722984261495400654889250285124533321022981475832539124544579218170536475258779537248807554699941937121725987852537935501915601362',
        '17.8438258394282509999', 21, 6);
    })
    /**
     * @tc.number    : DECIMAL_TEST5_017
     * @tc.name      : Decimal_ln_Func_017
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('222624724.707607328646707303867967259139519139629423079746317622391060720425657380049896682204826804719116517331792375328854607227578421004813898208914187979742668659057386237112777304292626154363413399007128375956303978756008642562104282496678212208286912567720592497594790267585324990906417857716073248926170009724869749739256517',
        '19.2209980629988594846457575', 27, 0);
      test_ln_001('185258598.8193913934519764713459928878217005284578212999298749640634191497175066526732902777761314076480735321777689520905932035413871290869941575745986362030629539',
        '19.03726323844184819241728391212796712905475895', 46, 3);
      test_ln_001('269693209.738329262863103619932258583418154544819938948520850885129975757878155942909813913575593873613967345697983513739799036745044974770565058447912595936725318596664619637466457786273308379783363276858754429871221986504763671381169376146393662591214420480616860804709987497567541966840009610585879458456647716651843692095645431144825029791181857768800342074145503590855886070320931830102002860548331131946643428330049680453526744262227',
        '19.4128', 6, 2);
      test_ln_001('1023342793.682203550119853590855855440825349592189658219400017324862237829261909743084375742003621225707754353154890001299178609037775929182416',
        '20.7', 3, 4);
      test_ln_001('288066409.930742086163569035868595871340060157483817829526835857178700227646660208478255306458767689905569779533532613990984463726169225',
        '19.4787016015557225466209307245195728148', 39, 6);
      test_ln_001('659962551.7196736389816108624246917556391933488125636501841767846136469655007635589597690345289565290187266991221823977105182413305954975153418768184526414022291854836356848438340284898272452919407497723633962181806929526702888572755311195630908175133297801595820610915241491322973994939537556926297001075794108221345170572608247217166782978965314275924298103649904183225053518681061802488451326',
        '20.307693651556304624603', 23, 2);
      test_ln_001('1507364652.7412807014310450849045388639397320237966928257974087635919752464931336652652563316012320514301796477028177198948086347984093073988211028197354698778354347658908468312563297806615829593697914663744507730778747959075016883455899218807867027301117084501104764662133718266594886462034333606057118803676760138265831276687149773555531764176520964444746495235029665718222485165667080758798726878577774041717453053559075165574861878572784439577325279859720699815',
        '21.133628699942067740343303809380556857137955185', 47, 5);
      test_ln_001('390145000.967298821818782016684792033527978825236257109725032636684195216173865101534596314015627154955417417356051726409514707961291776124601310897',
        '19.782029025340505793950028597475307602798983116', 47, 1);
      test_ln_001('1582186416.193367134722504736788921341001732540902935815137028669849087377143230724513115136185091885228053584573993361147951779854091136019178181014965525402328169438038737972227467851264',
        '21.18207353512', 13, 1);
      test_ln_001('444181511.379330635761040379043896319', '19.9117438462696047845568005370964420406847915', 45, 2);
      test_ln_001('1649165442.81508159186866091659911601847915727898761380479217148722967003628844958192423020437941929274541019164440472673454567347131337845196944956123772899539516241995922964069898844748283940385593209556832209762517653421012964293705687275161487307996022854435621786593342404292930985767687391343569565159759022658057195057590383081972675845225107300959105018192214115690180632353307',
        '21.223535204669576956240210909820794512745', 41, 5);
      test_ln_001('956193088.33977562292786906645507064275401232361020165960269744050571700135755870903976551991970971401541090373022939626590186869869098847675469870075789885973042670437758904496341260362989490245294442892663605116104481315514350394492341667402397008571518074733491886421982724176798753763402802355543297381889941871793636978236549161242963426659386692353226535780947411516134695241409391848436453976510684',
        '20.678470425872231784432536313273269750899620287', 47, 6);
      test_ln_001('524656579.6561082202986522788989992058097028959478133491616251386650273315481201712733337497961653741466850177948',
        '20.07825447252854998238544895', 28, 1);
      test_ln_001('412184042.8896878204667114461794718285421610397268782502943123737616921059160330553262782457035088179494074564563410048773731594742762676033110116212190491442443442166045598309788282584460671280467345157657971668722189192696185094311918310776057781011454221034130478455744396828404806478740586228712397995429199362271635020780002483852222338852479130612370279841990621710882872848128725669571603659740938524254161291050199148884609411958653228755273145468',
        '19.83698051361329059', 19, 5);


    })
    /**
     * @tc.number    : DECIMAL_TEST5_018
     * @tc.name      : Decimal_ln_Func_018
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('54177615.4161615199898039376707204324649188748836298320352749128620609118474310429998270745885186642610341190928928278585051565238331611651463560104044550438095405103019768593446391808685915870067181972775276870790595322163624212767962894314519491376965719216779872096909267426650844863008221945010966830813924747797605343830807190598639058151734866383440974952571052161557282681608575287009214045591019',
        '17.807779', 8, 0);
      test_ln_001('202208538.0186996731425487962109425863325508616918249176043925148428750848485730129706779656165064759679330957399949664528408543769938770452288279928848232018815279096218064756460984277961961770343996043873166572208624824439463192886927974622714849727874835303030139509530094904609301858682577824229369378223655885781140501472159022060380707281531318049222808388638845419183185',
        '19.124810089270938003831849629', 29, 4);
      test_ln_001('419077532.2448607619101987942607612824719743129742324423040412531483957695007192401517535342220366141599584852033167948744863351374575147495928944631030285526934314990168106650729902570735596692781194661598925404746581114061618262181809902436423306258562179673075380899236033671',
        '19.85356650192559415566417', 25, 3);
      test_ln_001('146708483.32674399300686866605976073019721421720619119889933263331964327217855614280622971093931911986466782717253122036096979367739887439449073138969919020714899901453823470883487750734885842377270384469297548135028684586032301609167142204835412029755367943305773471371240556395996807312138338709086180854612022228560209117316657640810924077420852085218504347155816788970471703339876',
        '18.803958069162751518238485267', 29, 5);
      test_ln_001('1.0000000000000000000000000000000000000000000000000001230000000000756',
        '0.000000000000000000000000000000000000000000000000000123', 3, 1);
      test_ln_001('1.0000000000000000000000000000000000000000000000000001230000000000756',
        '0.000000000000000000000000000000000000000000000000000123', 3, 1);
      test_ln_001('1.0000000000000000000000000000000000000000000000000001230000000000756',
        '0.0000000000000000000000000000000000000000000000000001230000000000756', 16, 0);
      test_ln_001('1.0000000000000000000000000000000000000000000000000001230000000000756',
        '0.0000000000000000000000000000000000000000000000000001230000000000755', 16, 1);
      test_ln_001('1.0000000000000000000000000000000000000000000000000001230000000000756',
        '0.00000000000000000000000000000000000000000000000000012300000000007559', 17, 1);
      test_ln_001('1.0000000000000000000000000000000000000000000000000001230000000000756',
        '0.0000000000000000000000000000000000000000000000000001230000000000755999999999999999999999999999999999999924354999999907011999999971423201',
        85, 0);
      test_ln_001('1.0000000000000000000000000000000000000000000000000001230000000000756',
        '0.00000000000000000000000000000000000000000000000000012300000000007559999999999999999999999999999999999999243549999999070119999999714232',
        83, 1);
      test_ln_001('1.000000001230000000756', '0.00000000122', 3, 1);
      test_ln_001('1.000000001230000000756', '0.00000000122999', 6, 1);
      test_ln_001('1.000000001230000000756', '0.00000000122999999999954', 15, 1);
      test_ln_001('0.9999999', '-0.0000001000000050000003333333583333353333335000000142857155357144', 58, 3);
      test_ln_001('0.999', '-0.001000500333583533500142983', 25, 0);
      test_ln_001('0.99', '-0.0100503358536', 12, 3);
      test_ln_001('1.0000000000001', '0.00000000000009999999999999501', 16, 2);
      test_ln_001('1.0000000000001', '0.0000000000000999999999999951', 15, 2);
      test_ln_001('1.0000000000001', '0.000000000000099999999999996', 14, 2);
    })
    /**
     * @tc.number    : DECIMAL_TEST5_019
     * @tc.name      : Decimal_ln_Func_019
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('1.00000000000001', '0.00000000000000999999999999996', 15, 2);
      test_ln_001('1.000000000000000000000000000000000000001',
        '0.0000000000000000000000000000000000000009999999999999999999999999999999999999995000001', 46, 0);
      test_ln_001('8.1', '2.09186', 6, 1);
      test_ln_001('39.6', '3.67883', 7, 2);
      test_ln_001('13.83', '2.62684015', 9, 4);
      test_ln_001('46.7', '4', 1, 0);
      test_ln_001('47.9', '4', 1, 4);
      test_ln_001('98.9', '4.59410924', 9, 4);
      test_ln_001('28.1', '3.33576957', 9, 3);
      test_ln_001('19.4', '2.9652731', 8, 0);
      test_ln_001('1.8', '0.587786665', 9, 4);
      test_ln_001('63.8', '4', 1, 4);
      test_ln_001('3.5', '1.25276296', 9, 3);
      test_ln_001('72.91', '5', 1, 2);
      test_ln_001('7.54', '2.020223', 7, 0);
      test_ln_001('61.1', '4.11251186', 9, 3);
      test_ln_001('64.3', '4.16', 3, 4);
      test_ln_001('70.4', '4.26', 3, 0);
      test_ln_001('40.34', '3.6973435', 8, 1);
      test_ln_001('97.56', '4.580468', 7, 0);

    })
    /**
     * @tc.number    : DECIMAL_TEST5_020
     * @tc.name      : Decimal_ln_Func_020
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('4.2', '1.4350845', 8, 1);
      test_ln_001('14.23', '2.65535', 6, 1);
      test_ln_001('21.41', '3.06', 3, 1);
      test_ln_001('86.5', '4.46014', 6, 3);
      test_ln_001('53.5', '3.97968', 6, 4);
      test_ln_001('41.2', '4', 1, 4);
      test_ln_001('22.67', '3.121', 4, 1);
      test_ln_001('39.1', '3.666122466', 10, 1);
      test_ln_001('20.8', '3.035', 4, 0);
      test_ln_001('27.72', '3.3221541743', 11, 3);
      test_ln_001('484260633.26', '19.9981', 6, 1);
      test_ln_001('739084458.57', '20.420922760027607325270794371574372', 35, 3);
      test_ln_001('173897238.6257338023989', '18.9739751001054747115892', 24, 0);
      test_ln_001('234294644.588885865140275679', '19.2720900461484484624992', 24, 6);
      test_ln_001('663446355.03930603', '20.312', 5, 3);
      test_ln_001('236924096.650141980105861288', '19.2832503', 9, 1);
      test_ln_001('383519031.802423', '19.7648998041', 12, 3);
      test_ln_001('495413774.3180056262693', '20.02090387906982718762754628426', 31, 0);
      test_ln_001('103272854.9147823146420226558', '18.4528851204168398068299228814439335', 36, 2);
      test_ln_001('1255876919.801289301817086', '20.9510999', 9, 4);
      test_ln_001('892565379.904099781', '20.6096103237295763729453899449191', 33, 5);

    })
    /**
     * @tc.number    : DECIMAL_TEST5_021
     * @tc.name      : Decimal_ln_Func_021
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('714436577.20394836', '20.38700479', 10, 2);
      test_ln_001('114209899', '18.5535', 6, 6);
      test_ln_001('11138070.731145', '16.225879593546584', 17, 1);
      test_ln_001('173982352.98970322915408', '18.9744644324360810729339336092249432', 36, 0);
      test_ln_001('601898865.418395208648', '20.2155999915160485142287883', 27, 2);
      test_ln_001('1737398240.940989286501485', '21.3', 3, 5);
      test_ln_001('1223195313.271302839406', '20.93', 4, 2);
      test_ln_001('483960664.70757792519406292', '19.9975141901128827175535702', 27, 0);
      test_ln_001('254561643.88559655966887725', '19.35505359', 10, 0);
      test_ln_001('230901371.26208883297662', '19.25750121307751', 16, 2);
      test_ln_001('39049637.3708272077470901', '17.480344148', 11, 5);
      test_ln_001('605727.08861135233', '13.314184814787811646051719561794', 32, 5);
      test_ln_001('110166953.414692391364862', '18.51750753144102983720945609400314449', 37, 3);
      test_ln_001('341161100.758980208051', '19.6478653599282687781757344218', 31, 4);
      test_ln_001('316912316.269705411968295', '19.57413568875', 13, 1);
      test_ln_001('1471705773.129049604979506', '21.1096879548887928212', 21, 2);
      test_ln_001('43608215.24072301429834', '17.6', 4, 0);
      test_ln_001('692035632.3', '20.3551480040192941281921918635691', 33, 4);
      test_ln_001('437966495.9954174972446009', '19.9', 3, 2);
      test_ln_001('1021072161.39012', '20.74411905080098544439092', 25, 0);
      test_ln_001('420919239.137', '19.85795154221623', 16, 2);

    })
    /**
     * @tc.number    : DECIMAL_TEST5_022
     * @tc.name      : Decimal_ln_Func_022
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('1478634317.69367498567837', '21.114384740403810652547', 23, 3);
      test_ln_001('7030.0000000004', '8.8579419848047674873993819813049734644306', 41, 3);
      test_ln_001('14302.00090090005', '9.5681547295995328150820246661661705098', 38, 1);
      test_ln_001('31131.999969929999979999', '10.34599150711339159800792', 25, 2);
      test_ln_001('11604.0000000000070005080090000000805009', '9.35910514524129523926613596795448321965442856295', 48,
        3);
      test_ln_001('31917.99991999999899997969', '10.37092539045270895006814258635431', 34, 2);
      test_ln_001('26753.94999', '10.194438', 8, 2);
      test_ln_001('29279.05000800090000700009000000000080004005030000097', '10.2846275224669583306543625537', 30, 3);
      test_ln_001('11553.00407000007000030000092', '9.3547007747724112152725332649758224586144889', 44, 4);
      test_ln_001('26807.0000000200007', '10.1964183264243228688799088559564488641428510584', 48, 2);
      test_ln_001('3714.999299999999899999999959999496999998995979949999999969399979',
        '8.2201337687265389341123277272836362405282053685', 47, 2);
      test_ln_001('11275.000001000060000080002000020000001000000000000005', '9.330343164459576214650017260944374', 34,
        1);
      test_ln_001('18404.00107000000000000700701009003008000000000000700203', '9.820323369414893', 16, 0);
      test_ln_001('11735.00000000200002', '9.37033110828529432', 18, 3);
      test_ln_001('29285.9', '10.28486145051', 13, 2);
      test_ln_001('24143.9999999999999599999999', '10.09179118100763013383', 22, 0);
      test_ln_001('1189.0000030020000000000000000080000006000030900907', '7.08086789921559259321173351103264209976', 39,
        3);
      test_ln_001('27341.0000008', '10.2161426860830683625276502597036387295831', 42, 1);
      test_ln_001('21469.99999999999969', '9.9744118908728266982', 20, 2);
      test_ln_001('3243.000000900007000000305000060209000000004000000900600000600013', '8.0842542', 8, 0);
    })
    /**
     * @tc.number    : DECIMAL_TEST5_023
     * @tc.name      : Decimal_ln_Func_023
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('16240.999999', '9.695294188113030278102040381421186919123', 40, 1);
      test_ln_001('2258.999199', '7.72267716188626709813978452604048821542674214', 45, 3);
      test_ln_001('14805.999994993999999999994994999999999799999999999299999999999',
        '9.602787782664937484827890675974506248220680541057', 49, 1);
      test_ln_001('6159.00400302', '8.725670355633251921000813056', 29, 0);
      test_ln_001('22763.99999999996999998992999959999939899999', '10.03293561972301', 16, 4);
      test_ln_001('12087.000090000000900500000000020500000000002', '9.3998857813', 11, 4);
      test_ln_001('24056.00008007005', '10.0881397279968507', 18, 0);
      test_ln_001('1273.9', '7.14983834011574117903670501641161393434448327659', 48, 0);
      test_ln_001('31641.0006006003000000000000000000050001', '10.36220904592643417978456213185992074668712', 43, 4);
      test_ln_001('28152.060004000000000000000007', '10.2453758104285329372599741260889658', 36, 3);
      test_ln_001('27680.00040003001010000500400000070000000000000050002', '10.228465424183556996128', 23, 2);
      test_ln_001('31218.00002030000000100090000050704010007079', '10.348750131168624384483033071', 29, 0);
      test_ln_001('11417.9', '9.342937578384608', 16, 4);
      test_ln_001('0.9999999999999999999199499999969999979699999999999999',
        '-0.00000000000000000008005000000300000203320400125024025016', 37, 4);
      test_ln_001('0.000010000000000000900406000400000060000021', '-11.51292546497013837', 19, 2);
      test_ln_001('0.999999999999939994989999999', '-0.000000000000060005010000002800300612550182023047506056', 41, 3);
      test_ln_001('0.979999999999999999', '-0.02020270731751944942845346428', 28, 1);
      test_ln_001('0.009009005050040300000400008', '-4.7095306407579573919326957858245838', 35, 4);
      test_ln_001('0.060080080020000000060000000000000080900000000000600000008087', '-2.81207693963633246203151', 24,
        4);
      test_ln_001('0.999997999999399997999993999949', '-0.000002000002600005866683246750786841565741132', 40, 4);
      test_ln_001('0.999999999999999999929929999997999979999999929799',
        '-0.00000000000000000007007000000200002000245497265114014', 34, 4);

    })
    /**
     * @tc.number    : DECIMAL_TEST5_024
     * @tc.name      : Decimal_ln_Func_024
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('0.08000009', '-2.5257275193088882518096775704454984610695', 41, 3);
      test_ln_001('0.00090400000000000000000004060600070700000809', '-7.0086811975720976072740759519732589', 35, 4);
      test_ln_001('0.000704006', '-7.25872367911527720999907560001613988913676912731866147366599498415', 66, 1);
      test_ln_001('0.08', '-2.52572864430825543979', 21, 0);
      test_ln_001('0.9999999929999199999499999999999999799999499',
        '-0.0000000070000800245505601178872580008623040894857280221937339', 53, 0);
      test_ln_001('0.99499998999694996999999999999999999397999299999', '-0.0050125518769', 11, 3);
      test_ln_001('0.0000000000020000007000005000002', '-26.93787358536841414877187370746409029977817', 43, 0);
      test_ln_001('0.009000002000002', '-4.71053048', 10, 0);
      test_ln_001('0.03000004', '-3.5065565639875372314061705613342488', 36, 2);
      test_ln_001('0.1754385964912280701754385965', '-1.74046617484051', 15, 3);
      test_ln_001('6.0', '1.791759469228055', 16, 6);
      test_ln_001('0.5', '-0.6931471805599453', 17, 2);
      test_ln_001('2.5', '0.91', 2, 1);
      test_ln_001('0.142857', '-1.94591114905582', 15, 3);
      test_ln_001('0.4545454545454545454', '-0.788457360364270169', 18, 2);
      test_ln_001('0.05', '-2.995732273553990993', 19, 2);
      test_ln_001('9.0', '2.1972245773362194', 17, 6);
      test_ln_001('2.0', '0.693147180559945', 15, 1);
      test_ln_001('0.02132196162046908315', '-3.84801767545223368', 18, 4);
      test_ln_001('0.1063829787234042553191', '-2.2407096893', 11, 0);
      test_ln_001('2.7', '0.9932518', 7, 0);
      test_ln_001('0.013440860215', '-4.3094559418430461815', 20, 1);
    })
    /**
     * @tc.number    : DECIMAL_TEST5_025
     * @tc.name      : Decimal_ln_Func_025
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('0.0107526881720430107526881', '-4.53259', 6, 2);
      test_ln_001('0.03125', '-3', 1, 5);
      test_ln_001('2.3', '0.8329', 4, 4);
      test_ln_001('0.015151515', '-4.18965475203', 12, 5);
      test_ln_001('0.01162790697674418', '-4.45434729626', 12, 0);
      test_ln_001('0.01584786053882725', '-4.1447207695471679983', 20, 3);
      test_ln_001('9.3', '2.2300144001', 11, 3);
      test_ln_001('36.0', '3.5835', 5, 3);
      test_ln_001('0.0111111111', '-4.4998096713302', 14, 2);
      test_ln_001('2.8', '1.1', 2, 2);
      test_ln_001('9.0', '2.197224577336219', 16, 3);
      test_ln_001('0.011363636363636363636', '-4.4', 2, 2);
      test_ln_001('70.0', '4.248495242', 11, 1);
      test_ln_001('0.0111111111111111', '-4.49980967033', 12, 5);
      test_ln_001('4.0', '1.39', 3, 5);
      test_ln_001('0.01117318', '-4.49423901528089', 15, 5);
      test_ln_001('0.2', '-1.60943791243410038', 18, 3);
      test_ln_001('0.2941176470588235294117', '-1.2237754316221157056', 20, 5);
      test_ln_001('25.0', '3.218875824868200749', 19, 4);
      test_ln_001('0.19230769230769230769230', '-1.64865862558738168', 18, 3);
      test_ln_001('35.0', '3.5553480614', 11, 3);
      test_ln_001('50.0', '3.9120230054281460586', 20, 5);
    })
    /**
     * @tc.number    : DECIMAL_TEST5_026
     * @tc.name      : Decimal_ln_Func_026
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('0.0241545893719806763285024', '-3.7233', 5, 4);
      test_ln_001('12.0', '2.484906', 7, 3);
      test_ln_001('0.077519379844', '-2.55722731138003', 15, 0);
      test_ln_001('78.9', '4', 1, 6);
      test_ln_001('4.9', '1.589235205116580927', 19, 2);
      test_ln_001('59.8', '4.091005660956586', 16, 1);
      test_ln_001('4.2', '1.43509', 6, 0);
      test_ln_001('0.02', '-3.9121', 5, 3);
      test_ln_001('60.0', '4.09', 3, 1);
      test_ln_001('0.7692307', '-0.26236435', 8, 2);
      test_ln_001('0.333333333333', '-1.09861228866911', 15, 0);
      test_ln_001('0.02732240437158469945', '-3.600048240407', 13, 5);
      test_ln_001('0.061728395061728395', '-2.8', 2, 6);
      test_ln_001('8.0', '2.07944154', 9, 5);
      test_ln_001('0.9999999999999999999999999999999999999568192301488826794261698690972956411635111284787367786816502083882422798578731605252106199479075698',
        '-0.00000000000000000000000000000000000004318076985111732057383013090270435884', 37, 4);
      test_ln_001('0.9999999999999999999999979550666058305047704469654544926170385722676726565280928302935213393351515069436413391635857924053031503612857234287',
        '-0.000000000000000000000002044933394169495', 16, 6);
      test_ln_001('0.9999999999999999999999999999788589934323601088222420429829335393675583983311669404940044418555472559469792115593688854910667629732945617',
        '-0.000000000000000000000000000021141006567639891177757', 23, 2);
    })
    /**
     * @tc.number    : DECIMAL_TEST5_027
     * @tc.name      : Decimal_ln_Func_027
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('0.99999965612996150232225742078449327047019615530457466722741143133687180033806758021000178033650121765045177844535360974813202360649705716806472085515573024723452129710679277030691649',
        '-0.00000034387009762099298460124920225891418549479847', 44, 3);
      test_ln_001('0.999999999999999999998', '-0.000000000000000000002', 11, 6);
      test_ln_001('0.99998389456495199790866464051967145510973599943414379845553913640458143099808775839406749813252',
        '-0.0000161055647419136538238914419840240365', 36, 5);
      test_ln_001('1.000000000000000000000000000000000000000002453877989156637807977474490521127775312951564217698150',
        '0.0000000000000000000000000000000000000000024539', 5, 4);
      test_ln_001('0.999999987593466883036919655717507752311798436584262710410080485802440651098', '-0.00000001240653',
        7, 6);
      test_ln_001('1.000000018472078439367595548243230561734', '0.0000000184720782687587567141685374276721136', 36, 0);
      test_ln_001('1.000000000000000000000000000027061294139028140296788935076920940602313183007831066627748504596064337387546517866314036676735728406098988897643792775080246506595767189394976464369',
        '0.0000000000000000000000000000271', 3, 6);
      test_ln_001('0.999999999999999999999999999999999999999999999999983236514849608313776995668242152423498923869153102324092773269164486380023512206',
        '-0.0000000000000000000000000000000000000000000000000167634851503916862230043317578', 30, 2);
      test_ln_001('0.999999999999999999998364', '-0.000000000000000000001636', 12, 4);
      test_ln_001('0.999999999984247763351546132381201803224221320759305237486792312341695697664625337191197409538174918606370093200173235377160974530349186640210056578324041384176737202852579773243',
        '-0.0000000000157522366485779340985139462', 27, 6);
      test_ln_001('0.9999999999999999999990018683160077458539750633020995640413381403082761992348270405950390259594627171842',
        '-0.0000000000000000000009981317', 7, 4);
      test_ln_001('0.99999999999999999999999999999999999999999999999999985408483944',
        '-0.00000000000000000000000000000000000000000000000000014591516056', 35, 1);
      test_ln_001('0.999999999999999999999999999999999999999999999999998739619976',
        '-0.000000000000000000000000000000000000000000000000001260380024', 19, 6);
      test_ln_001('0.99999999999999999999999999999999999999999999999999999885639999798325100337440101041086693875558962971018414706077286569119145472180293030705985903425546926770196944598420458571451206946321039210',
        '-0.0000000000000000000000000000000000000000000000000000011436000020167489966255989895891330612444103702898',
        50, 5);

    })
    /**
     * @tc.number    : DECIMAL_TEST5_028
     * @tc.name      : Decimal_ln_Func_028
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('0.9999999999999999999999999999998813849879156043674936830517787361054747787',
        '-0.0000000000000000000000000000001186', 4, 2);
      test_ln_001('1.0000000000000000000278495935577735173108449580311901557454985107031530689779032404701969152386509968231412912032547047938976884258008764161145204',
        '0.000000000000000000027849', 5, 1);
      test_ln_001('0.9999999999999999973362461433229285135656310591384423930035289356669163226763087894358613606844049018612982044184276721128495686590536237237362306901212',
        '-0.0000000000000000026637538566770714899821612453425437643031829', 44, 5);
      test_ln_001('1.00000000000000176253868933517211924999595559448630464030179930682524750778432581467161581396555777249054042674040627129810092955303337',
        '0.000000000000001762538689335170566', 20, 5);
      test_ln_001('0.99999999999999999999999999999999999977092768577305435532481001390241851854279230037455',
        '-0.000000000000000000000000000000000000229072314226945644675189986097581481', 36, 1);
      test_ln_001('0.9999999999999999999999999999999999999999999999999999999872655993173067727213258266707420877839338907224927740881477058093177568467325181347117970284259875332114167',
        '-0.0000000000000000000000000000000000000000000000000000000127344006826932272786742', 24, 3);
      test_ln_001('1.0000000172264280662442594957709154039786849716698889540202736142143930380',
        '0.00000001722642791786934923900676', 25, 5);
      test_ln_001('0.999999999999999999999999999999999982912873108922',
        '-0.000000000000000000000000000000000017087126891078', 29, 2);
      test_ln_001('0.999999999999999999999999999999999999999999993901016148293422192196736265601661935467416309801727317670352425687933',
        '-0.0000000000000000000000000000000000000000000060989838517065778078032637343983381', 35, 5);
      test_ln_001('1.0000000000000000000000000000000000001557068218834187197100492745906330662942472387805706361042981050161586903484636128434617775053436339425448812194544548',
        '0.0000000000000000000000000000000000001557068218834187197100492745906330663', 37, 6);
      test_ln_001('0.9999999999999999999999999999965',
        '-0.000000000000000000000000000003500000000000000000000000000006125', 37, 4);
      test_ln_001('0.999999999978069784575542971695341560698127887742654234264366033657806',
        '-0.00000000002193021542469749548', 19, 6);
      test_ln_001('0.99999999999999999999999999999999999999971989402139646726487926603258362083338',
        '-0.00000000000000000000000000000000000000028010597861', 11, 3);
      test_ln_001('1.0000000005777313213100622689185785411683162890830022421832393625555641832484284367817582206653835891277275299383003063423401888577943921722016789943432463695865333',
        '0.00000000057773132114317552917152047', 26, 0);
      test_ln_001('0.99998899817496551713109615150897242336013399949226209047495781001932', '-0.000011001885556', 11,
        3);
      test_ln_001('0.9999999999999999999999999999999999999998297812400933250983600309185363087152186898130964880717734025466693634260269779753896445207544565324993821252294277099318291490267724329103905',
        '-0.00000000000000000000000000000000000000017021875990667490163996908', 26, 2);

    })
    /**
     * @tc.number    : DECIMAL_TEST5_029
     * @tc.name      : Decimal_ln_Func_029
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('0.999999999999999999999999999999867678505517799638290521749019978249164551148555611278304293867128540415736157410807909474981350886279390744210330912921984627066838448347590465998102019224',
        '-0.0000000000000000000000000000001323', 4, 6);
      test_ln_001('0.99999999999999955124573963968202720343790876222338286616005694319199910050972066877767645901567386160990300',
        '-0.0000000000000004487542', 7, 2);
      test_ln_001('1.00000000000000000000000000000000000000000000000000000000238653373610066251324626982217917546085298331873741456053912434675',
        '0.0000000000000000000000000000000000000000000000000000000023865337361006625132462698221791754608529833187', 47,
        6);
      test_ln_001('0.9999861381597997249299307707821689337357639252598918981802356169251231384862641946832270120025664317350590928784923055179837234141982333351243328116077696716052298729080148160342',
        '-0.000013861936276469802', 18, 5);
      test_ln_001('0.999518302013578741663390652958008318798483548326838687601953768440697860',
        '-0.00048181404016638611452172080975', 30, 2);
      test_ln_001('0.999999999999999999999999999999999999999999999999999998330036520393109006599069774962',
        '-0.000000000000000000000000000000000000000000000000000001669963479606891', 18, 0);
      test_ln_001('0.9999999999971982592566014030229274322557335630334721819051248984500648246070196539508012557622985639254125086208121666523259793307451588484063477678399192077493910841989290',
        '-0.00000000000280174074340252185266918493667', 30, 6);
      test_ln_001('1.0000000000000000000000000000000000000000000000000003081468179941393977604635738549120099277215766896592811135855391834253391376095954064189345149319503595848525394170943997567283',
        '0.0000000000000000000000000000000000000000000000000003081468179941393977604635738549120099', 37, 3);
      test_ln_001('1.0101564097626380683093087282120826613421424331759509214909151214101003',
        '0.0101051800145446340394781491861117815898', 39, 6);
      test_ln_001('0.99999999999999999999999999999999999999999999999999998835768423821199588003439629108184316187951135202946432288978839496371393350180031770629223550075209192125418982248995945098956877584132',
        '-0.00000000000000000000000000000000000000000000000000001164231576178800411996', 22, 1);
      test_ln_001('0.999999999999999999999999999999999999999999999999999999999976872096656109063431181886276194814782001823830665873550337102544082509981820955995454425929992234626018878531564551440745722576230',
        '-0.00000000000000000000000000000000000000000000000000000000002312790334389093657', 19, 5);
      test_ln_001('0.9999999967066363395314220', '-0.00000000329336366589170011195437', 24, 6);
      test_ln_001('1.0857744658E-87', '-200.242609564754818345602', 24, 6);
      test_ln_001('7967796600342935039987851875126979686690856098804803834653251050081030306760096147743650654823921573015034335799167324649191446374757438.0484311242',
        '312.924395547087248674854', 24, 2);
      test_ln_001('4.959906063275914201262895287E-84', '-191.8157610097980062', 19, 3);
      test_ln_001('247605260094390353104779047655089617126976010142339438487265438023612656.077017582415972838691597824259541',
        '164.390207201496998614488673041664777028805542', 45, 0);
    })
    /**
     * @tc.number    : DECIMAL_TEST5_030
     * @tc.name      : Decimal_ln_Func_030
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('7.397668035008368', '2', 1, 3);
      test_ln_001('1.0643E-106', '-244.011702551303980943176356044', 30, 0);
      test_ln_001('2.350797564113792872976049891678503E-39', '-89', 2, 5);
      test_ln_001('89.249409735932840957', '5', 1, 0);
      Decimal.set({ toExpNeg: 0, toExpPos: 0 });
      test_ln_001('3.22623980772186395511829472880667363767934689738221E+295688495330',
        '6.808479215178688102694343822133e+11', 31, 6);
      test_ln_001('3.1424008119820360904816828115594380261542633787339288E+6142101067398',
        '1.4142710357454596074562853825e+13', 29, 0);
      test_ln_001('8.799993E-79577', '-1.832306391942611440981400905118e+5', 32, 0);
      test_ln_001('8.70504056438959496505198875861603616462926E-5971', '-1.374657168803434206833683423555e+4', 31, 4);
      test_ln_001('8.4006029856E+923125420044', '2.1e+12', 2, 3);
      test_ln_001('4.0119839E-3299350', '-7.59703273728404749704426251310976420299891015285939e+6', 51, 2);
      test_ln_001('4.3302768368838848441860607605878081415720594735E+76594',
        '1.7636566824426052100565028315589397992162e+5', 41, 3);
      test_ln_001('3.8E+329784205242', '7.59356194896453019208845913197638776266462015689e+11', 48, 6);
      test_ln_001('7.6732416747937E+1102', '2.53948651164891795785685349144456466914229134475e+3', 48, 2);
      test_ln_001('2.077820490683659388975846E+723625853', '1.666210102754220135345042493516555e+9', 34, 4);
      test_ln_001('6.688785E-28910', '-6.65658346062145642467325909920069259e+4', 36, 6);
      test_ln_001('6.0136041193424216912E-17927305397954', '-4.1279146166878774234420729153e+13', 29, 3);
      test_ln_001('5.096332862894596814711832511046074722E+745', '1.71705441551516514163775766e+3', 27, 5);
      test_ln_001('5.84975137363E+67993', '1.565614346271e+5', 13, 6);
      test_ln_001('86581147739152189809997746256.485303', '6.6630879609165666865732779356483110831e+1', 39, 1);
      test_ln_001('2.12911330891919120203E+120504404889', '2.774716463382859039792244911807807628997e+11', 40, 2);
    })
    /**
     * @tc.number    : DECIMAL_TEST5_031
     * @tc.name      : Decimal_ln_Func_031
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('7.73433077472591367533265625623113999102E+390676254432750',
        '8.9956531964360115679915101731401388487e+14', 38, 6);
      test_ln_001('6.6826213753466680887906226588379005611546E-372991246306821',
        '-8.58844083563354531569986979442855776105e+14', 39, 5);
      test_ln_001('6.3492829903214E+3226', '7.42998785189041059280107543537699949138759874551e+3', 48, 0);
      test_ln_001('5.6620362147525246713E+777935299', '1.79126222452504931719151086e+9', 27, 0);
      test_ln_001('3.534154532190555885356307279594067464756994468E+36066880',
        '8.3047061501279186616689782347665205e+7', 35, 5);
      test_ln_001('3.5985126E+813569', '1.87331313204266617163386909806087492179897e+6', 42, 4);
      test_ln_001('8.02230502097885864396312997120584356127409109053488632E+57250',
        '1.3182507879969879935820551962408658e+5', 35, 3);
      test_ln_001('3.2733347380805773227156921973744955625117401773271E+7057864470',
        '1.625133351818013021763445401573927815324e+10', 40, 3);
      test_ln_001('3.200965011955166876210847170951991936E+25194197', '5.801178360560763736986182698175e+7', 31, 0);
      test_ln_001('2.49662549037205161930152513676222984332E-1769526964968889', '-4.074486411188359782e+15', 19, 1);
      test_ln_001('8.933353606087814264271069533725820479127E+94', '2.1863279060963e+2', 14, 2);
      test_ln_001('7.8520496399200949742657682831082508285588236E+751160063', '1.729609965577042813e+9', 20, 6);
      test_ln_001('9.8629670476255586848298885792269963362202371766864992350515E+76670756',
        '1.76540942122970827049200662319103105281075e+8', 42, 2);
      test_ln_001('7.164E+232', '5.36168810058817064037155119131349345287989327560924493423e+2', 57, 2);
      test_ln_001('7.0140848964616709789085128982324775586720562136938322979723E+94920694282961',
        '2.18562975672593082614e+14', 21, 0);
      test_ln_001('5.15295798111342379029337279689740749964293074731042E+75391',
        '1.73595832316829153955358568211169000080658e+5', 42, 3);
      test_ln_001('4.75511906567739510224E+9281276469', '2.1370928843035034699971447557867150369194e+10', 41, 1);
      test_ln_001('9.3428582919353239756E+9473', '2.1814623198164992616236995269818e+4', 32, 2);
      test_ln_001('8.69428902381899286125995853877646262336481547649342271017E+28073656389526',
        '6.464198270836177218138049860623405271087114955052778e+13', 52, 1);
      test_ln_001('3.736323028448724390151054937514728816501552616248E-859672555164790',
        '-1.979469210378545532338977821722936e+15', 34, 0);
    })
    /**
     * @tc.number    : DECIMAL_TEST5_032
     * @tc.name      : Decimal_ln_Func_032
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('8.3704021992314838607708728021923440173295401079057777619E+51053',
        '1.175560014545608380866313681e+5', 28, 0);
      test_ln_001('6.328946425890222657711855468334E+28226', '6.4994611968630829105921275070197989840133161484e+4', 47,
        1);
      test_ln_001('581028.112757643064563527683530', '1.327255e+1', 7, 4);
      test_ln_001('5.044E+675213', '1.554737006595206671115965015e+6', 28, 2);
      test_ln_001('8.419E-4010970724', '-9.235601395387443688559191477601e+9', 31, 1);
      test_ln_001('51.2111719483', '3.9359577104e+0', 11, 2);
      test_ln_001('8.81634594656560180086916089974763812544168318286235E-824049757446', '-1.897444687e+12', 10, 4);
      test_ln_001('6.2212997114E-553559942', '-1.27461886869986969345097622349731651e+9', 36, 3);
      test_ln_001('235519025969854529810574120108993578243.19971', '8.8354855047659717507839540458e+1', 29, 3);
      test_ln_001('7.0258964578196427071536597563115415415640043575157590', '1.9e+0', 2, 3);
      test_ln_001('9.738596641858094986444163000772706367196726E+109229400188311', '2.52e+14', 3, 0);
      test_ln_001('8.62703833E+5568507422742', '1.28219621818345766335259463697135358656004154175e+13', 48, 0);
      test_ln_001('8.41305546301539271737600098357065745E-7295979', '-1.67996103544128833514984735034663e+7', 33, 3);
      test_ln_001('2.5232060242873444092576213384933104665517329499810802952E+8132082', '1.872481171374e+7', 13, 2);
      test_ln_001('7.9297195306E+65', '1.5173864871148797849494244247043518353031307868144564e+2', 53, 0);
      test_ln_001('3.64689986228734945266932E+62', '1.44054153219522787090894392411068439321378481560180842e+2', 54, 5);
      test_ln_001('1.334192043174385742450630E-39646400', '-9.1289209342554e+7', 14, 0);
      test_ln_001('2.612654672780E+2075312996908189', '4.7785847699775949720482e+15', 23, 4);
      test_ln_001('2578000917.79692', '2.16702800974745614276078088977272042e+1', 36, 6);
      test_ln_001('6.596856211693040993166106964362605852614690053358144E-8062494978', '-1.85646e+10', 6, 3);
      test_ln_001('6.0879876921111929476500485212617470990636329749748587985E-601',
        '-1.382047323290527848037209499935e+3', 31, 2);
    })
    /**
     * @tc.number    : DECIMAL_TEST5_033
     * @tc.name      : Decimal_ln_Func_033
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('3.286699439E+4569470654914505', '1.052159501287987952020793970337e+16', 31, 0);
      test_ln_001('3.637336824738188102903230332461981310841753899084935587E+10761051833',
        '2.477823753689330253840044863e+10', 28, 2);
      test_ln_001('3.7477430030903749357328391677904495853650E+20869',
        '4.8053969459485685179695549117734336870515492158e+4', 47, 2);
      test_ln_001('3.140337150756E-13712400984', '-3.1573970093770953376660919898558265466406669093e+10', 47, 2);
      test_ln_001('8.48368791870432056292625630300375084950237347894278E+624032870', '2e+9', 1, 0);
      test_ln_001('6.5815151328134220328E+98443649460178', '2.2667487974693907959622819142544911252715e+14', 41, 5);
      test_ln_001('1.7723561424140845E+247846099271', '5.7068673353869932302832431846669628468118839468307384e+11', 53,
        1);
      test_ln_001('3.0949198435280859777489812648334758766940462500408883433646E+2469192456080',
        '5.68552574110429262534321058697983662070785392e+12', 45, 3);
      test_ln_001('0.85025805182099765686920489225574772214389', '-1.6221538519436441661125978316259087269126272e-1',
        44, 4);
      test_ln_001('4.432834164971387041E-4507057882525783', '-1e+16', 2, 1);
      test_ln_001('3.988922913035675507988353278783407292371E+4694273500', '1.08089641849205055e+10', 18, 3);
      test_ln_001('3.01186469E+2545169058', '5.860468333203e+9', 13, 5);
      test_ln_001('9.0748866591646251314532E+47614', '1.096374921287092159e+5', 19, 2);
      test_ln_001('5.6180796113670596347965219927087524242601615E+3880377312075',
        '8.93489895397792489522883676797722624255e+12', 39, 1);
      test_ln_001('8.098147787316401427624109754110153170688558350457541922717E+8910511',
        '2.05172118911948342992282908397e+7', 30, 4);
      test_ln_001('5.42868111005864502392394132989497156E+59059832747', '1.359902905e+11', 10, 4);
      test_ln_001('4.70991012341588450130232666320921407597912267207E+65217922', '1.5e+8', 2, 3);
      test_ln_001('7.6016818135485428149331576079477334360182454470810066E+628508014', '1.44719318589e+9', 12, 4);
      test_ln_001('8.76577418121734880922387712030769537853138823619109E+32845', '7.5630579e+4', 8, 2);
      test_ln_001('3.989639481915478229949501547E-3562148605', '-9e+9', 1, 0);
      test_ln_001('7.50095976711871808229778395340891745932E+459172412',
        '1.05728355300035123967283065534499540845423548025e+9', 48, 3);
      test_ln_001('1.094234101086547061145E+8105185598', '1.8662879534e+10', 11, 6);
    })

    /**
     * @tc.number    : DECIMAL_TEST5_034
     * @tc.name      : Decimal_ln_Func_034
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('8.6184097550403752866225958864653E-99458373', '-2.29011364889340897937584119444696367e+8', 36, 1);
      test_ln_001('8.370E+4643496155876', '1.0692045027897357766979173674e+13', 29, 2);
      test_ln_001('8.8260530736377112408404700113658970187344553009119498E+69', '1.6105607934074696962533009034085e+2',
        32, 5);
      test_ln_001('7.21733459581750946992541376472150E+771894752', '1.7773533512920215e+9', 17, 1);
      test_ln_001('8.0398697796858068264510296618162080456174991956226525E-45122871',
        '-1.03899248033280440664832913861293e+8', 33, 3);
      test_ln_001('3.85595703190443742440250277361605E+6091482618322',
        '1.40261570711819248808711059594479942105082367007e+13', 48, 2);
      test_ln_001('7.357095166801105623865E+549536691', '1.265354994745540324309072336890594e+9', 34, 5);
      test_ln_001('1.34533963650515436161701665448464441752127512E+350235747270701', '8.0644761e+14', 8, 4);
      test_ln_001('6.4170057575167730015652576742667741692190869016E+8059951144', '1.8558723356293656512085e+10', 23,
        3);
      test_ln_001('2.4077049295833173373548E-25994301660937', '-5.98540915073e+13', 12, 6);
      test_ln_001('4.535541075E+20', '4.8e+1', 2, 5);
      test_ln_001('7.29846078607878771302050492452384424889888683E-537191033751', '-1.236928066403126e+12', 16, 1);
      test_ln_001('2.634898074241585E+90138333023', '2.0755118193e+11', 11, 2);
      test_ln_001('5.46374939035500947103431106687153167480402538E-73753665680',
        '-1.698240911467364203540944369371346431880400463389e+11', 49, 6);
      test_ln_001('2.94299515946637E+607707720', '1.3992987380488273006987151692498736952760425e+9', 44, 4);
      test_ln_001('3.668100638398885156015068016729087120382965349467E+84070728', '1.935800063496311111975e+8', 22, 1);
      test_ln_001('4.4E+2003110597803675', '4.6123326021e+15', 11, 5);
      test_ln_001('1.91685802862500097138466392461E+49834', '1.1474767e+5', 8, 3);
      test_ln_001('7.8060858E-167062888423895', '-3.8467651647738609186703184862365050751052e+14', 41, 1);
      test_ln_001('1.978E+5', '1.219501169817074879173281038e+1', 28, 0);
      test_ln_001('5.77970666253418116761098030625E+223072047', '5.13642371840220060515235912414184521974662502e+8', 47,
        1);
    })

    /**
     * @tc.number    : DECIMAL_TEST5_035
     * @tc.name      : Decimal_ln_Func_035
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('5.47649676344748751812140943259036448E-6697621', '-1.5421840572658253455977679095638082e+7', 35, 2);
      test_ln_001('5.89272783085181716889488732225953E-80979', '-1.8645926452654519628853278905466928e+5', 35, 0);
      test_ln_001('3.9142246447271235587364475518772E+6792548012', '1.56404197972421574013185426e+10', 27, 6);
      test_ln_001('1.03654E-8829328', '-2.03302789980666878287e+7', 21, 4);
      test_ln_001('2.966963898883723964406622179262104271E-40046044', '-9.22094228602444715139934346e+7', 27, 6);
      test_ln_001('2.17861809580860432485578624E+39', '9.05795094015633624269836517536636343e+1', 36, 4);
      test_ln_001('8.5860E+9131106', '2.10251507082814583119796429685249702465e+7', 39, 0);
      test_ln_001('1.5412779579669645484712783548614741E+4221134711453',
        '9.7195218621118328121695164047507959011952e+12', 41, 3);
      test_ln_001('54.944027854626073894087463822117107421615', '4e+0', 2, 1);
      test_ln_001('5.89E+4068309134235820', '9.36762796618291285378e+15', 21, 1);
      test_ln_001('1.7782332841915159444510812658618254919081488280E-473555786043',
        '-1.09040249364311393587934959869e+12', 31, 5);
      test_ln_001('5.856153556936941211324932376345E-5610591872515871', '-1.2918865208528592e+16', 18, 5);
      test_ln_001('8.5879657E+4990177546', '1.1490308e+10', 8, 3);
      test_ln_001('6.806688317295882211444994250555E+7553266453',
        '1.73920387400077162987035162411978513704566862686e+10', 48, 1);
      test_ln_001('3.135921508105851703665460164485160881268374510455809E+807064325772890',
        '1.8583342856119478444383845e+15', 26, 0);
      test_ln_001('8.7301419368711031383740359E+35766359667870', '8.235508660190309563654957418152355352e+13', 37, 1);
      test_ln_001('152800352584718396.185354581216539422462692444', '3.956790857913206e+1', 16, 5);
      test_ln_001('2.61910077229511946E+546201856', '1.2576762523541114e+9', 17, 0);
      test_ln_001('7.448579204378498328767018243284618725336368289559954260E-217700846293938',
        '-5.0127472340860766741454583700554e+14', 33, 5);
      test_ln_001('7.2047727251858696241230866828095732184425269645695E+469327', '1.0807e+6', 5, 5);
      test_ln_001('6.218121194045431347809839E+4016425286', '9.25e+9', 3, 5);
      test_ln_001('3.96380380194329769560709701426464939552303967224636432913E+5456751169',
        '1.2564633899294436616578509015890963439260854e+10', 45, 6);
    })

    /**
     * @tc.number    : DECIMAL_TEST5_036
     * @tc.name      : Decimal_ln_Func_036
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('8.90161993871518743436E+9653801', '2.222870045956428697966183595567898564e+7', 37, 5);
      test_ln_001('5.87E-8679033343444315', '-1.998421279821315e+16', 17, 0);
      test_ln_001('7.22213E+9285', '2.1381479738372961297283e+4', 23, 4);
      test_ln_001('4.35089061025101631586337334243547962566776053387632747687140E+45018821795390', '1.03659668e+14', 10,
        2);
      test_ln_001('8.9507732063667418791057293120281614104087038631714939252E-8440914505', '-1.94359239e+10', 9, 6);
      test_ln_001('3.090280901682869634794313045175007461412804E+841576988836944', '1.9378026291027647750230631e+15',
        26, 0);
      test_ln_001('7.7014162551739797973497506E+702559370030249', '1.61770273e+15', 9, 5);
      test_ln_001('4.0025445459842369782426336331309922717E+9723', '2.238942178947647308221847e+4', 25, 0);
      test_ln_001('2.2341E+313775048695', '7.224937496793916263102024244423062e+11', 34, 2);
      test_ln_001('7.926192471441099330397999580E-784167', '-1.80560917444508379549407756805599569268569223e+6', 45, 1);
      test_ln_001('4.16722E-49749952', '-1.145534964251201622427e+8', 23, 5);
      test_ln_001('7.359482014076842029356125469162217556349E+51298586184260', '1.181e+14', 4, 3);
      test_ln_001('72.7973', '4.287678866602e+0', 13, 1);
      test_ln_001('7.458369731089099586537743665754431425332815238574619459129E+851537468000449', '1.96073748e+15', 10,
        6);
      test_ln_001('6.811927352E+97672323', '2.248988368565745651603981641555e+8', 31, 0);
      test_ln_001('7.48744078897258414951220797837E+890299', '2.05e+6', 5, 0);
      test_ln_001('9.9786940300229550246920496767E+159423', '3.6708732373261279057236148539102006386167991e+5', 44, 2);
      test_ln_001('2.38741991405492015313119224178735E+9478681816955', '2.182547145295516879843288985e+13', 28, 2);
      test_ln_001('2.766573766937788216474557230E+30', '7.00951624371767949074247262566550894e+1', 37, 4);
      test_ln_001('3.62838465078525030E+7741738753458588', '2e+16', 1, 2);
      test_ln_001('7E+2084142509237', '4.79891547344626727113852205192e+12', 30, 1);
    })

    /**
     * @tc.number    : DECIMAL_TEST5_037
     * @tc.name      : Decimal_ln_Func_037
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('6.632399246416402141258204555971393162485E+5282951327214421',
        '1.216444497305703653967296294053184676613657e+16', 44, 5);
      test_ln_001('9.3160920091238143684430426114185923861195316789176E+9009721765428', '2.0745e+13', 5, 1);
      test_ln_001('9.3685E+670410418', '1.543677e+9', 8, 5);
      test_ln_001('2.5346294534658525082446802192095498605896343566597E+4300272406899978',
        '9.9017431399415154341560132628634710568864551e+15', 44, 0);
      test_ln_001('4.646038E+85', '1.97255748e+2', 9, 5);
      test_ln_001('7.11299819E+7082753304', '1.63e+10', 3, 1);
      test_ln_001('7.60429765973931070947601E+223343106', '5.14266508527302571586964653405e+8', 30, 0);
      test_ln_001('1.259774278348886756714714853102551787716753309044316124949E+712621',
        '1.6408707224870705769939774744309009702195e+6', 41, 1);
      test_ln_001('6.0261907885269058826333443505093996174E+6436400131',
        '1.482035899598163792393092381789529257871165943e+10', 46, 3);
      test_ln_001('2.30437658671337063317129505E+933', '2.15e+3', 4, 0);
      test_ln_001('3.513354973190022585498661637765E+7375148', '1.69819070999962638165306055501e+7', 30, 3);
      test_ln_001('3.59522279140903230506716479623E+86968785461810', '2.002530289601622667750807006104599119026e+14',
        40, 1);
      test_ln_001('2.323805246716532118808402603969727E+9227297604', '2.12466e+10', 6, 6);
      test_ln_001('4.19231E-7592313503421', '-1.748194789431315881762449482356139169e+13', 37, 1);
      test_ln_001('2.824917408520510981566548810161099E-652378', '-1.502154819318141286164e+6', 22, 2);
      test_ln_001('9.12243E-50019117136', '-1.1517327347986588780346729255272976018954e+11', 41, 0);
      test_ln_001('3E+762827674466452', '1.756475631749768085398731e+15', 25, 4);
      test_ln_001('7.88476026918002602572814E-990381735', '-2.280438217319647492655582971583716101855286985546894e+9',
        52, 3);
      test_ln_001('1.93876182E+451', '1.0391279265e+3', 11, 2);
      test_ln_001('7.3740736325E+654774', '2e+6', 1, 6);
      test_ln_001('7E+4834316708582532', '1.113142558799418024006562114e+16', 28, 4);
    })

    /**
     * @tc.number    : DECIMAL_TEST5_038
     * @tc.name      : Decimal_ln_Func_038
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('8.419903621598494995504679345354396264274607872E-81228',
        '-1.87032251335338520070667445258625347255285029857514040215222e+5', 60, 2);
      test_ln_001('5043072.7', '1.543352611697716150423861515247087376581267e+1', 43, 0);
      test_ln_001('9.967071401753478835579846245480959735737425E-30800642339454', '-7.092109991e+13', 10, 6);
      test_ln_001('7.9191984564270720102158323147796783178696538378E+4299108154110', '9.89906234e+12', 9, 3);
      test_ln_001('64572.983932271806289465556', '1.10755513969156443144229910347268775332908e+1', 42, 1);
      test_ln_001('1.937714E+843491028282664', '1.942209867797881766126295470773e+15', 31, 0);
      test_ln_001('6.9114234023582240731E+5055056421210478',
        '1.16396975597230781881412937544250850646634588400335279264924e+16', 60, 2);
      test_ln_001('4.961229890606203486886459941941277127027E+604148', '1.39110378041583852706104753424975e+6', 33, 1);
      test_ln_001('1.2295412035299050272723E+2703096359889097', '6.224109383e+15', 10, 4);
      test_ln_001('9.657371691296E+308989382', '7.1147434715436423514160983064473799366383290739381572967375e+8', 59,
        2);
      test_ln_001('1.4128908712960608623688853001789149213438E+2145',
        '4.93939066234102715130453498008430346620462153038006e+3', 51, 6);
      test_ln_001('26144210329259503349147403065.297086', '6.54334252745142805327741060175e+1', 30, 6);
      test_ln_001('8.33725972357462126144877718036E-640752', '-1.47538388278e+6', 12, 0);
      test_ln_001('4.1590152196231371771711659246E+403232512853795',
        '9.284771731076797069605043792598349156233286259e+14', 46, 1);
      test_ln_001('9.82E+13', '3.22180273312889684123493284e+1', 27, 3);
      test_ln_001('7.82843348542643E+46', '1.079766767019947895265445329067662e+2', 34, 5);
      test_ln_001('8.811680861027610685596511333077922481897E+767481402198272', '1.7671912358519e+15', 14, 6);
      test_ln_001('1.2646988103492E-98338836657', '-2.264335393485497795949962419719976584598e+11', 40, 2);
      test_ln_001('1.540214958114481019557937E+59181121', '1.3626956743319885978e+8', 20, 6);
      test_ln_001('2.2618706725559597340E-80442266991491', '-1.85225164821253339576e+14', 21, 3);
      test_ln_001('2.25864914751234848775875033898256307911050778157110133811791E-309527450036735',
        '-7.127132923270444743819e+14', 22, 3);
    })

    /**
     * @tc.number    : DECIMAL_TEST5_039
     * @tc.name      : Decimal_ln_Func_039
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('2.330814534885802362082745596145962939767778133925858E+3904036936174', '8.989377251733e+12', 13, 4);
      test_ln_001('3.0420074653830109395743228528E+921305605563904',
        '2.121384553463298577109196723086986800668975639e+15', 46, 5);
      test_ln_001('1.0E+872', '2.0078542e+3', 8, 3);
      test_ln_001('1.323555869318702120137287477E-422', '-9.714105872883810124432881156687558071e+2', 37, 2);
      test_ln_001('4.84867115556496735086756738807727439043049075112985641565E+614778',
        '1.415580237005372281896918768840573147097e+6', 40, 2);
      test_ln_001('6833491.742', '1.57373463369279317127597002209e+1', 31, 4);
      test_ln_001('6.13048371442940275525618964841722738636998403233077810E-779320416', '-1.79445157073424472e+9', 18,
        0);
      test_ln_001('6.0898902427122806E+4688', '1.07963255460151024248754967714575317203653e+4', 42, 2);
      test_ln_001('9.86452924549600460448324612453147245449268E+84761347812',
        '1.9517021593628361608673649350374236821833483200901459714e+11', 56, 0);
      test_ln_001('3.9176116276489746389198699E+414', '9.54635710688990638428e+2', 21, 2);
      test_ln_001('4.095990639970856826151360589E+22632687948659',
        '5.2113689884969610573321058748008149098043826274e+13', 47, 2);
      test_ln_001('8.39387938871195E+763256545', '1.75746314477464181041383599861e+9', 30, 0);
      test_ln_001('7.800050366E+62060334923', '1.428992020619717061857733637740779046196932e+11', 43, 6);
      test_ln_001('8.089598709221611344683604575548820409668250E+87031175958679', '2.00396688388198128829e+14', 21, 4);
      test_ln_001('5.10635917896490647888E+3182', '7.3284562525678883986172066777758364471375155394546945442e+3', 56,
        6);
      test_ln_001('0.0091575773634501050584', '-4.69317361524979007029379576e+0', 27, 3);
      test_ln_001('7.57895891043427E+89609785', '2.0633415715277728333795242903376837197944185472408033310945e+8', 59,
        1);
      test_ln_001('3.52931879025497378514095E-394665', '-9.087484846216199820657414e+5', 25, 5);
      test_ln_001('9.25007957288654366172E+74427302675', '1.71375197653435e+11', 15, 5);
      test_ln_001('9.689571004958528405688233E+6725552890171551', '1.54861578270520357492776037597261680823721e+16', 42,
        5);
    })

    /**
     * @tc.number    : DECIMAL_TEST5_040
     * @tc.name      : Decimal_ln_Func_040
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_ln_001('6.18835267180055712238377841454729349189226E+231771635055534', '5.3367391185773059667279852591e+14',
        29, 2);
      test_ln_001('9.9940433950867406385462586629E+57', '1.33549339555687132737e+2', 21, 1);
      test_ln_001('5.2273640460183882551198285667311888762451852768642903877382E+86461', '1.99085e+5', 6, 1);
      test_ln_001('3.7574919683230201675805072575E+3940', '9.0735090181e+3', 12, 5);
      test_ln_001('0.3264874060', '-1.1193639037508e+0', 14, 5);
      test_ln_001('6.617722342369695540731E+87617', '2.01747487844113004556646596647711367404988980698550912078993e+5',
        60, 2);
      test_ln_001('9.778534925839331822328485E+581875', '1.3398189811755800735983579926048573829203557e+6', 45, 0);
      test_ln_001('8.869065070E+6945', '1.599e+4', 4, 4);
      test_ln_001('3.13179778997337826067565187594790293739361810498E+22775780', '5.245e+7', 4, 0);
      test_ln_001('5.012E+3260', '7.50803923819762275176671578932335515919818e+3', 42, 0);
      test_ln_001('8.37869137029350445E+900', '2.07445227543587787134124946870990167444156501037595873e+3', 54, 1);
      test_ln_001('5.23468330E+979', '2.255886112387006112695230143368806974046102370335747e+3', 52, 4);
      test_ln_001('5.9982205441659493126046E+2517', '6e+3', 1, 2);
      test_ln_001('7E+5', '1.3458835614025541e+1', 17, 1);
      test_ln_001('8.36991087473514132639620816460727714124539564560E+114871900769', '2.64502326e+11', 9, 1);
      test_ln_001('9.9102170675767525486462268743104768E+722282888', '2e+9', 1, 5);
      test_ln_001('88.7213950103796184597368396487398', '4.4855e+0', 5, 1);
      test_ln_001('8.245971550E+8358202', '1.92454734391578027453548100134030572e+7', 36, 2);
    })
    /**
     * @tc.number    : DECIMAL_TEST5_041
     * @tc.name      : Decimal_ln_Func_041
     * @tc.desc      : Test ln
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_ln_Func_041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Decimal.set({
        precision: 40,
        rounding: 4,
        toExpNeg: -9e15,
        toExpPos: 9e15,
        minE: -9e15,
        maxE: 9e15
      });
      try {
        test_ln_001('e', '11', 17, 1);
        expect(true).assertEqual(false);
      } catch (err: BusinessError) {
        expect(err.name).assertEqual(`BusinessError`);
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual(`The type of "test(str)" must be Hex/Binary/Octal. Received value is: e`);
      }
    })

    /**
     * @tc.number    : DECIMAL_TEST_042
     * @tc.name      : Decimal_floor_Func_042
     * @tc.desc      : Test floor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_floor_Func_042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Decimal.set({
        precision: 20,
        rounding: 4,
        toExpNeg: -1e3,
        toExpPos: 1e3,
        minE: -9e15,
        maxE: 9e15
      });
      test_floor_001('0', 0);
      test_floor_001('-0', -0);
      test_floor_002('0', '0.000');
      test_floor_001('Infinity', Infinity);
      test_floor_001('-Infinity', -Infinity);
      test_floor_001('NaN', NaN);
      test_floor_001('0', 0.1);
      test_floor_002('0', '0.49999999999999994');
      test_floor_001('0', 0.5);
      test_floor_001('0', 0.7);
      test_floor_001('-1', -0.1);
      test_floor_002('-1', '-0.49999999999999994');
      test_floor_001('-1', -0.5);
      test_floor_001('-1', -0.7);
      test_floor_001('1', 1);
      test_floor_001('1', 1.1);
      test_floor_001('1', 1.5);
      test_floor_001('1', 1.7);
      test_floor_001('-1', -1);
      test_floor_001('-2', -1.1);
      test_floor_001('-2', -1.5);
      test_floor_001('-2', -1.7);
    })
    /**
     * @tc.number    : DECIMAL_TEST_043
     * @tc.name      : Decimal_floor_Func_043
     * @tc.desc      : Test floor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_floor_Func_043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_floor_002('1', '1.0000000000000000000000001');
      test_floor_001('0', 0.999999999999);
      test_floor_002('9', '9.999999999999');
      test_floor_001('123456', 123456.789);
      test_floor_002('-2', '-1.0000000000000000000000001');
      test_floor_001('-1', -0.999999999999);
      test_floor_002('-10', '-9.999999999999');
      test_floor_001('-123457', -123456.789);
      test_floor_002('-2075365', '-2075364.364286541923');
      test_floor_002('60593539780450631', '60593539780450631');
      test_floor_002('65937898671515', '65937898671515');
      test_floor_002('-39719494751819198566799', '-39719494751819198566798.578');
      test_floor_002('92627382695288166556', '92627382695288166556.8683774524284866028260448205069');
      test_floor_002('-881574', '-881574');
      test_floor_002('-3633239210', '-3633239209.654526163275621746013315304191073405508491056');
      test_floor_002('-23970335459820625362', '-23970335459820625362');
      test_floor_002('131869457416154038', '131869457416154038');
      test_floor_002('-2685', '-2685');
    })
    /**
     * @tc.number    : DECIMAL_TEST_044
     * @tc.name      : Decimal_floor_Func_044
     * @tc.desc      : Test floor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_floor_Func_044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Decimal.set({
        precision: 20,
        rounding: 4,
        toExpNeg: -1e3,
        toExpPos: 1e3,
        minE: -9e15,
        maxE: 9e15
      });
      test_floor_002('-4542227861', '-4542227860.9511298545226');
      test_floor_002('-834103872107533086', '-834103872107533086');
      test_floor_002('-1501493189970436', '-1501493189970435.74866616700317');
      test_floor_002('70591', '70591.2244675522123484658978887');
      test_floor_002('4446128540401735117', '4446128540401735117.435836700611264749985822486641350492901');
      test_floor_002('-597273', '-597273');
      test_floor_002('729117', '729117.5');
      test_floor_002('-729118', '-729117.001');
      test_floor_002('4803729546823170064608098091', '4803729546823170064608098091');
      test_floor_002('-6581532150677269472830', '-6581532150677269472829.38194951340848938896000325718062365494');
      test_floor_002('2949426983040959', '2949426983040959.8911208825380208568451907');
    })

    /**
     * @tc.number    : DECIMAL_TEST_045
     * @tc.name      : Decimal_floor_Func_045
     * @tc.desc      : Test floor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_floor_Func_045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_floor_002('25166', '25166.125888418871654557352055849116604612621573251770362');
      test_floor_002('4560569286495', '4560569286495.98300685103599898554605198');
      test_floor_002('13', '13.763105480576616251068323541559825687');
      test_floor_002('9050999219306', '9050999219306.7846946346757664893036971777');
      test_floor_002('39900924', '39900924.00000005');
      test_floor_002('115911043168452445', '115911043168452445');
      test_floor_002('20962819101135667464733349383', '20962819101135667464733349383.8959025798517496777183');
      test_floor_002('4125789711001606948191', '4125789711001606948191.4707575965791242737346836');
      test_floor_002('-6935502', '-6935501.294727166142750626019282');
      test_floor_002('-2', '-1.518418076611593764852321765899');
      test_floor_002('-35416', '-35416');
      test_floor_002('6912783515683955988122411164548', '6912783515683955988122411164548.393');
      test_floor_002('657', '657.0353902852');
      test_floor_002('0', '0.00000000000000000000000017921822306362413915');
      test_floor_002('1483059355427939255846407887', '1483059355427939255846407887.011361095342689876');
      test_floor_002('7.722e+999999999999999', '7.722e+999999999999999');
      test_floor_002('7722', '7722');
      test_floor_002('0', '0.00000005');
    })

    /**
     * @tc.number    : DECIMAL_TEST_046
     * @tc.name      : Decimal_floor_Func_046
     * @tc.desc      : Test floor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_floor_Func_046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      test_floor_002('8551283060956479352', '8551283060956479352.5707396');
      test_floor_002('0', '0.000000000000000000000000019904267');
      test_floor_002('321978830777554620127500539', '321978830777554620127500539.339278568133088682532238002577');
      test_floor_002('2073', '2073.532654804291079327244387978249477171032485250998396');
      test_floor_002('677676305591', '677676305591.2');
      test_floor_002('39181479479778357', '39181479479778357');
      test_floor_002('0', '0.00000000000000000087964700066672916651');
      test_floor_002('115083055948552475', '115083055948552475');
      test_floor_002('9105942082143427451223', '9105942082143427451223');
      test_floor_002('0', '0.00000000000000000000004');
      test_floor_002('0', '0.000250427721966583680168028884692015623739');
      test_floor_002('0', '0.000000000001585613219016120158734661293405081934');
      test_floor_002('0', '0.00009');
      test_floor_002('0', '0.000000090358252973411013592234');
      test_floor_002('276312604693909858427', '276312604693909858427.21965306055697011390137926559');
      test_floor_002('0', '0.0000252');
      test_floor_002('1', '1.9999999999');
    })

    /**
     * @tc.number    : DECIMAL_TEST_047
     * @tc.name      : Decimal_floor_Func_047
     * @tc.desc      : Test floor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    // it("Decimal_floor_Func_047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   Decimal.set({ toExpNeg: -100, toExpPos: 100 });
    //   test_floor_001('-1', -1e-308);
    //   test_floor_001('-1e+308', -1e308);
    //   test_floor_002('2.1e+308', '2.1e308');
    //   test_floor_002('-1', '-1e-999');
    //   test_floor_002('0', '1e-999');
    //   test_floor_002('0', '1e-9000000000000000');
    //   test_floor_002('-1', '-1e-9000000000000000');
    //   test_floor_002('-0', '-9.9e-9000000000000001');
    //   test_floor_002('9.999999e+9000000000000000', '9.999999e+9000000000000000');
    //   test_floor_002('-9.999999e+9000000000000000', '-9.999999e+9000000000000000');
    //   test_floor_002('Infinity', '1E9000000000000001');
    //   test_floor_002('-Infinity', '-1e+9000000000000001');
    //   test_floor_002('5.5879983320336874473209567979e+287894365', '5.5879983320336874473209567979e+287894365');
    //   test_floor_002('-5.5879983320336874473209567979e+287894365', '-5.5879983320336874473209567979e+287894365');
    // })

    /**
     * @tc.number    : DECIMAL_TEST_048
     * @tc.name      : Decimal_floor_Func_048
     * @tc.desc      : Test floor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("Decimal_floor_Func_048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      Decimal.set({
        precision: 20,
        rounding: 4,
        toExpNeg: -1e3,
        toExpPos: 1e3,
        minE: -9e15,
        maxE: 9e15
      });
      try {
        test_floor_002('e', 'e');
        expect(true).assertEqual(false);
      } catch (err: BusinessError) {
        expect(err.name).assertEqual(`BusinessError`);
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual(`The type of "test(str)" must be Hex/Binary/Octal. Received value is: e`);
      }
    })
  })
}