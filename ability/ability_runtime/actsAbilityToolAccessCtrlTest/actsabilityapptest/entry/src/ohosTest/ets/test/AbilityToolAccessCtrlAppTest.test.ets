/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { abilityToolAccessCtrl } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function abilityTest() {
  describe('ActsAbilityAppTest', function () {
    beforeAll(async function (done) {
      console.info('[Sec_SAF_AgentFence012] beforeAll called.');
      done();
    });

    afterAll(async function (done) {
      console.info('[Sec_SAF_AgentFence012] afterAll called.');
      done();
    });

    beforeEach(function () {
      console.info('[Sec_SAF_AgentFence012] beforeEach called.');
    });

    afterEach(function () {
      console.info('[Sec_SAF_AgentFence012] afterEach called.');
    });

    it('Sec_SAF_AgentFence012_001', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_001] requestToolPermissions with undefined parameter');
      try {
        abilityToolAccessCtrl.requestToolPermissions(undefined).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_001 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_001 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Parameter error');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_001] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_002', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_002] requestToolPermissions with null parameter');
      try {
        abilityToolAccessCtrl.requestToolPermissions(null).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_002 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_002 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Parameter error');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_002] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_003', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_003] requestToolPermissions with empty operationInfo');
      let permissionQuery = {
        operationInfo: [],
        needTicket: false
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_003 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_003 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Parameter error');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_003] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_004', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_004] requestToolPermissions without operationInfo');
      let permissionQuery = {
        needTicket: false
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_004 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_004 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Mandatory parameters are left unspecified');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_004] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_005', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_005] requestToolPermissions with wrong operationInfo type');
      let permissionQuery = {
        operationInfo: 'wrongType',
        needTicket: false
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_005 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_005 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Incorrect parameter types');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_005] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_006', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_006] requestToolPermissions with missing operationType');
      let permissionQuery = {
        operationInfo: [{
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: false
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_006 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_006 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Mandatory parameters are left unspecified');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_006] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_007', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_007] requestToolPermissions with missing info');
      let permissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI
        }],
        needTicket: false
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_007 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_007 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Mandatory parameters are left unspecified');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_007] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_008', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_008] requestToolPermissions with wrong operationType type');
      let permissionQuery = {
        operationInfo: [{
          operationType: 'wrongType',
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: false
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_008 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_008 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Incorrect parameter types');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_008] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_009', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_009] requestToolPermissions with wrong info type for CLI');
      let permissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: 'wrongInfoType'
        }],
        needTicket: false
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_009 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_009 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Incorrect parameter types');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_009] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_010', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_010] requestToolPermissions with wrong CliCmdInfo type');
      let permissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd'
          }
        }],
        needTicket: false
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_010 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_010 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Mandatory parameters are left unspecified');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_010] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_011', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_011] requestToolPermissions with wrong needTicket type');
      let permissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: 'wrongType'
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_011 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_011 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Incorrect parameter types');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_011] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_012', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_012] requestToolPermissions with wrong ticketExpireTimeMs type');
      let permissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: true,
        ticketExpireTimeMs: 'wrongType'
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_012 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_012 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Incorrect parameter types');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_012] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_013', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_013] requestToolPermissions with wrong callerTokenId type');
      let permissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: true,
        callerTokenId: 'wrongType'
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_013 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_013 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Incorrect parameter types');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_013] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_014', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_014] requestToolPermissions with wrong domainId type');
      let permissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: true,
        domainId: 12345
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_014 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_014 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Incorrect parameter types');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_014] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence012_015', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence012_015] requestToolPermissions with wrong info type for API');
      let permissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: {
            permission: 'ohos.permission.CAMERA'
          }
        }],
        needTicket: false
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence012_015 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_015 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Incorrect parameter types');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence012_015] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('Sec_SAF_AgentFence013_001', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence013_001] requestToolPermissions with callerTokenId -1');
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: false,
        callerTokenId: -1
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence013_001 success, data: ' + JSON.stringify(data));
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence013_001 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(24010002);
          expect(err.message).assertContain('Common internal error');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence013_001] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(24010002);
        done();
      }
    });

    it('Sec_SAF_AgentFence013_002', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence013_002] requestToolPermissions with ticketExpireTimeMs -1');
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: true,
        ticketExpireTimeMs: -1
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence013_002 success, data: ' + JSON.stringify(data));
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence013_002 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(24010002);
          expect(err.message).assertContain('Common internal error');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence013_002] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(24010002);
        done();
      }
    });

    it('Sec_SAF_AgentFence013_003', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence013_003] requestToolPermissions with operationType -1');
      let permissionQuery = {
        operationInfo: [{
          operationType: -1,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: false
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence013_003 success, data: ' + JSON.stringify(data));
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence013_003 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(24010002);
          expect(err.message).assertContain('Common internal error');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence013_003] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(24010002);
        done();
      }
    });

    it('Sec_SAF_AgentFence013_004', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence013_004] requestToolPermissions with multiple parameters -1');
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: true,
        ticketExpireTimeMs: -1,
        callerTokenId: -1
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence013_004 success, data: ' + JSON.stringify(data));
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence013_004 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(24010002);
          expect(err.message).assertContain('Common internal error');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence013_004] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(24010002);
        done();
      }
    });

    it('Sec_SAF_AgentFence013_005', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence013_005] requestToolPermissions with negative callerTokenId');
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.CAMERA'
        }],
        needTicket: false,
        callerTokenId: -999
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence013_005 success, data: ' + JSON.stringify(data));
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence013_005 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(24010002);
          expect(err.message).assertContain('Common internal error');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence013_005] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(24010002);
        done();
      }
    });

    it('Sec_SAF_AgentFence013_006', 0, async function (done) {
      console.info('[Sec_SAF_AgentFence013_006] requestToolPermissions with negative ticketExpireTimeMs');
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.CAMERA'
        }],
        needTicket: true,
        ticketExpireTimeMs: -999999
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence013_006 success, data: ' + JSON.stringify(data));
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence013_006 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(24010002);
          expect(err.message).assertContain('Common internal error');
          done();
        });
      } catch (error) {
        console.error('[Sec_SAF_AgentFence013_006] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(24010002);
        done();
      }
    });
  });
}