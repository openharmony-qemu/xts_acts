import { describe, it, expect } from '@ohos/hypium';
import group_member_test from 'libgroup_member_test.so';

export default function groupMemberTest() {
  describe('ActsGroupMemberTest', () => {

    /**
     * @tc.name   testMuslGroupMember0100
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0100
     * @tc.desc   当前有效gid的组成员判断成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0100', 0, () => {
      let data: number = group_member_test.GroupMember_0100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslGroupMember0200
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0200
     * @tc.desc   不存在gid 99999返回非成员0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0200', 0, () => {
      let data: number = group_member_test.GroupMember_0200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslGroupMember0300
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0300
     * @tc.desc   group_member占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0300', 0, () => {
      let data: number = group_member_test.GroupMember_0300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslGroupMember0400
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0400
     * @tc.desc   group_member占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0400', 0, () => {
      let data: number = group_member_test.GroupMember_0400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslGroupMember0500
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0500
     * @tc.desc   gid为0的组成员判断成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0500', 0, () => {
      let data: number = group_member_test.GroupMember_0500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslGroupMember0600
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0600
     * @tc.desc   重复调用当前gid组成员判断成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0600', 0, () => {
      let data: number = group_member_test.GroupMember_0600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslGroupMember0700
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0700
     * @tc.desc   group_member占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0700', 0, () => {
      let data: number = group_member_test.GroupMember_0700();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslGroupMember0800
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0800
     * @tc.desc   group_member占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0800', 0, () => {
      let data: number = group_member_test.GroupMember_0800();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslGroupMember0900
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0900
     * @tc.desc   再次调用当前gid组成员判断成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GROUP_MEMBER_0900', 0, () => {
      let data: number = group_member_test.GroupMember_0900();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslGroupMember1000
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_MEMBER_1000
     * @tc.desc   group_member占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GROUP_MEMBER_1000', 0, () => {
      let data: number = group_member_test.GroupMember_1000();
      expect(data).assertEqual(0);
    });
  });
}
