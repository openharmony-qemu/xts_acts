/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import cencTest from 'libcencinfotest.so';
import { describe, it, expect } from '@ohos/hypium';
export default function otoTest() {
describe('CencInfoCapiUnitTest', () => {
  it('CencInfo_Create_001', 0, () => {
    let ret: number = cencTest.cencInfoCreate(0);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_Destroy_001', 0, () => {
    let ret: number = cencTest.cencInfoDestroy(0);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_Destroy_002', 0, () => {
    let ret: number = cencTest.cencInfoDestroy(1);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_SetAlgorithm_001', 0, () => {
    let ret: number = cencTest.cencInfoSetAlgorithm(0);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_SetAlgorithm_002', 0, () => {
    let ret: number = cencTest.cencInfoSetAlgorithm(1);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_SetKeyIdAndIv_001', 0, () => {
    let ret: number = cencTest.cencInfoSetKeyIdAndIv(0);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_SetKeyIdAndIv_002', 0, () => {
    let ret: number = cencTest.cencInfoSetKeyIdAndIv(1);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_SetKeyIdAndIv_003', 0, () => {
    let ret: number = cencTest.cencInfoSetKeyIdAndIv(2);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_SetKeyIdAndIv_004', 0, () => {
    let ret: number = cencTest.cencInfoSetKeyIdAndIv(3);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_SetKeyIdAndIv_005', 0, () => {
    let ret: number = cencTest.cencInfoSetKeyIdAndIv(4);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_SetKeyIdAndIv_006', 0, () => {
    let ret: number = cencTest.cencInfoSetKeyIdAndIv(5);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_SetMode_001', 0, () => {
    let ret: number = cencTest.cencInfoSetMode(0);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_SetMode_002', 0, () => {
    let ret: number = cencTest.cencInfoSetMode(1);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_SetAVBuffer_001', 0, () => {
    let ret: number = cencTest.cencInfoSetAVBuffer(0);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_SetAVBuffer_002', 0, () => {
    let ret: number = cencTest.cencInfoSetAVBuffer(1);
    expect(ret).assertEqual(0);
  });
  it('CencInfo_SetAVBuffer_003', 0, () => {
    let ret: number = cencTest.cencInfoSetAVBuffer(2);
    expect(ret).assertEqual(0);
  });
});}