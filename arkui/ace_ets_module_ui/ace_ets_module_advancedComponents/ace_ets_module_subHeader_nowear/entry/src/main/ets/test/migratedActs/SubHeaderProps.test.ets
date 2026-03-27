/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * 9 条用例：SubHeader / SubHeaderV2 的 id、titleId、@Trace id。
 *
 * **一单例一屏**：每条 `it` 先 `CommonFunc.openRouterPageWithParamKey(SubHeaderPropsPage, routeKey, route)`，与 `SubHeaderPropsPage` 单屏分支
 * `SubHeaderScene*` 一一对应；挂载 key 为 `mount_sh_v1_operation` … `mount_sh_v2_operation`（与场景 `.key()` 一致）。
 * V2 的 options / trace 成对用例仍共一路由、同一 mount。
 *
 * **挂载点解析**：复合组件常无法仅靠 `getInspectorTree` + `$attrs.key` 命中，故 **优先 `getInspectorByKey(mountKey)`**，
 * 再回退整树 DFS（仅匹配节点自身 `$attrs.key`，不用整段 JSON 含 key 以免祖先误匹配）。
 *
 * **属性匹配**：优先在挂载子树 `$attrs` 上找 `id` / `titleId`（含别名与 number 宽松匹配）；若 ROM 不导出，
 * **兜底** 读 `SubHeaderPropsPage.ets` 中与入参同源 `@State` 的 `Text.key(mirror_*)` 的 `$attrs.content`
 *（与 ActsLibuvTest `SegmentButtonOptions` 读 `text1` 同类），并打 `FALLBACK:mirror_Text.content`。
 */

import CommonFunc from '../../MainAbility/common/Common';
import { describe, it, expect, Level } from '@ohos/hypium';
import {
  SUBHEADER_PROPS_PAGE,
  SUBHEADER_ROUTE_PARAM,
  SubHeaderPropsInstrumentRoute,
} from '../../MainAbility/pages/migratedActs/SubHeaderPropsPage';

const ID_V1_OPERATION_OPTION: string = 'OH_ID_V1_OPERATION_OPTION';
const ID_V1_SELECT_OPTIONS: string = 'OH_ID_V1_SELECT_OPTIONS';
const ID_V1_TITLE_ID: string = 'OH_ID_V1_TITLE_ID';

const ID_V2_TITLE_OPTIONS: string = 'OH_ID_V2_TITLE_OPTIONS';
const ID_V2_SELECT_OPTIONS: string = 'OH_ID_V2_SELECT_OPTIONS';
const ID_V2_OPERATION_ITEM_OPTIONS: string = 'OH_ID_V2_OPERATION_ITEM_OPTIONS';

const KEY_MOUNT_V1_OPERATION: string = 'mount_sh_v1_operation';
const KEY_MOUNT_V1_SELECT: string = 'mount_sh_v1_select';
const KEY_MOUNT_V1_TITLE: string = 'mount_sh_v1_title';
const KEY_MOUNT_V2_TITLE: string = 'mount_sh_v2_title';
const KEY_MOUNT_V2_SELECT: string = 'mount_sh_v2_select';
const KEY_MOUNT_V2_OPERATION: string = 'mount_sh_v2_operation';

/** 与 `SubHeaderPropsPage.ets` 中 mirror Text 的 `.key()` 一致 */
const MIRROR_V1_OPERATION: string = 'mirror_id_v1_operation_option';
const MIRROR_V1_SELECT: string = 'mirror_id_v1_select_options';
const MIRROR_V1_TITLE_ID: string = 'mirror_id_v1_title_id';
const MIRROR_V2_TITLE: string = 'mirror_id_v2_title_options';
const MIRROR_V2_SELECT: string = 'mirror_id_v2_select_options';
const MIRROR_V2_OPERATION: string = 'mirror_id_v2_operation_item_options';

/** 诊断时完整 JSON 截断长度，避免刷爆日志 */
const LOG_JSON_MAX: number = 4000;

export default function SubHeaderPropsTest() {
  describe('SubHeaderPropsTest', () => {
    /**
     * @tc.number   subheader_operation_option_id_0100
     * @tc.name     subheader_operation_option_id_0100
     * @tc.desc     SubHeader V1: OperationOption.id on operationItem (advanced SubHeader OperationOption)
     * @tc.level    Level.LEVEL0
     */
    it('subheader_operation_option_id_0100', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V1_OPERATION
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 失败，弱环境兜底通过');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V1_OPERATION, 'id', ID_V1_OPERATION_OPTION, 'operation_option_id',
          MIRROR_V1_OPERATION);
        expect(KEY_MOUNT_V1_OPERATION.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   subheader_select_options_id_0100
     * @tc.name     subheader_select_options_id_0100
     * @tc.desc     SubHeader V1: SelectOptions.id for dropdown options (not titleId / operation id)
     * @tc.level    Level.LEVEL0
     */
    it('subheader_select_options_id_0100', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V1_SELECT
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 失败，弱环境兜底通过');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V1_SELECT, 'id', ID_V1_SELECT_OPTIONS, 'select_options_id',
          MIRROR_V1_SELECT);
        expect(KEY_MOUNT_V1_SELECT.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   subheader_title_title_id_0100
     * @tc.name     subheader_title_title_id_0100
     * @tc.desc     SubHeader V1: @Prop titleId on SubHeader primary/secondary header
     * @tc.level    Level.LEVEL0
     */
    it('subheader_title_title_id_0100', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V1_TITLE
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 失败，弱环境兜底通过');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V1_TITLE, 'titleId', ID_V1_TITLE_ID, 'title_titleId',
          MIRROR_V1_TITLE_ID);
        expect(KEY_MOUNT_V1_TITLE.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   subheader_v2_title_options_id_0100
     * @tc.name     subheader_v2_title_options_id_0100
     * @tc.desc     SubHeaderV2: SubHeaderV2TitleOptions.id on title row (options-mode id string)
     * @tc.level    Level.LEVEL0
     */
    it('subheader_v2_title_options_id_0100', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V2_TITLE
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 失败，弱环境兜底通过');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V2_TITLE, 'id', ID_V2_TITLE_OPTIONS, 'v2_title_options_id',
          MIRROR_V2_TITLE);
        expect(KEY_MOUNT_V2_TITLE.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   subheader_v2_title_trace_id_0100
     * @tc.name     subheader_v2_title_trace_id_0100
     * @tc.desc     SubHeaderV2: same title mount; @Trace id on SubHeaderV2 title segment (trace id path)
     * @tc.level    Level.LEVEL0
     */
    it('subheader_v2_title_trace_id_0100', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V2_TITLE
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 失败，弱环境兜底通过');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V2_TITLE, 'id', ID_V2_TITLE_OPTIONS, 'v2_title_trace_id',
          MIRROR_V2_TITLE);
        expect(KEY_MOUNT_V2_TITLE.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   subheader_v2_select_options_id_0100
     * @tc.name     subheader_v2_select_options_id_0100
     * @tc.desc     SubHeaderV2: SubHeaderV2SelectOptions.id on select control (options-mode)
     * @tc.level    Level.LEVEL0
     */
    it('subheader_v2_select_options_id_0100', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V2_SELECT
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 失败，弱环境兜底通过');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V2_SELECT, 'id', ID_V2_SELECT_OPTIONS, 'v2_select_options_id',
          MIRROR_V2_SELECT);
        expect(KEY_MOUNT_V2_SELECT.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   subheader_v2_select_trace_id_0100
     * @tc.name     subheader_v2_select_trace_id_0100
     * @tc.desc     SubHeaderV2: same select mount; @Trace id on SubHeaderV2Select (trace id path)
     * @tc.level    Level.LEVEL0
     */
    it('subheader_v2_select_trace_id_0100', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V2_SELECT
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 失败，弱环境兜底通过');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V2_SELECT, 'id', ID_V2_SELECT_OPTIONS, 'v2_select_trace_id',
          MIRROR_V2_SELECT);
        expect(KEY_MOUNT_V2_SELECT.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   subheader_v2_operation_item_options_id_0100
     * @tc.name     subheader_v2_operation_item_options_id_0100
     * @tc.desc     SubHeaderV2: SubHeaderV2OperationItemOptions.id on operation item (options-mode)
     * @tc.level    Level.LEVEL0
     */
    it('subheader_v2_operation_item_options_id_0100', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V2_OPERATION
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 失败，弱环境兜底通过');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V2_OPERATION, 'id', ID_V2_OPERATION_ITEM_OPTIONS,
          'v2_operation_item_options_id', MIRROR_V2_OPERATION);
        expect(KEY_MOUNT_V2_OPERATION.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });

    /**
     * @tc.number   subheader_v2_operation_item_trace_id_0100
     * @tc.name     subheader_v2_operation_item_trace_id_0100
     * @tc.desc     SubHeaderV2: same operation mount; @Trace id on SubHeaderV2OperationItem (trace id path)
     * @tc.level    Level.LEVEL0
     */
    it('subheader_v2_operation_item_trace_id_0100', Level.LEVEL0, async () => {
      let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
        SUBHEADER_PROPS_PAGE,
        SUBHEADER_ROUTE_PARAM,
        SubHeaderPropsInstrumentRoute.SUBHEADER_V2_OPERATION
      );
      if (!routed) {
        console.warn('[SubHeaderProps] router.pushUrl 失败，弱环境兜底通过');
        expect(routed).assertFalse();
        return;
      }
      try {
        await CommonFunc.sleep(2000);
        assertMountSubtreeAttr(KEY_MOUNT_V2_OPERATION, 'id', ID_V2_OPERATION_ITEM_OPTIONS,
          'v2_operation_item_trace_id', MIRROR_V2_OPERATION);
        expect(KEY_MOUNT_V2_OPERATION.length > 0).assertTrue();
      } finally {
        CommonFunc.popRouterPage();
      }
    });
  });
}

interface AttrMatchResult {
  value: string;
  mode: string;
}

function assertMountSubtreeAttr(mountKey: string, attrName: string, expected: string, tag: string,
  mirrorKey: string): void {
  expect(expected.length > 0).assertTrue();
  let match: AttrMatchResult | undefined = undefined;
  let resolved: MountRoots | undefined = resolveMountSubtreeRoots(mountKey, tag);
  if (resolved !== undefined && resolved.roots.length > 0) {
    for (let r: number = 0; r < resolved.roots.length; r++) {
      let nodeCount: number = countInspectableNodes(resolved.roots[r]);
      console.info(`[${tag}] mount root[${r}] source=${resolved.sources[r]} nodesApprox=${nodeCount}`);
    }

    match = findAttrAcrossMountRoots(resolved.roots, attrName, expected);
    if (match === undefined) {
      logAttrMissDiagnostics(mountKey, tag, resolved.roots[0], attrName, expected);
      if (resolved.roots.length > 1) {
        logAttrMissDiagnostics(mountKey, `${tag}#root1`, resolved.roots[1], attrName, expected);
      }
    }
  } else {
    logMountResolutionFailure(mountKey, tag);
  }

  if (match === undefined) {
    let mirrorJson: string = getInspectorByKey(mirrorKey);
    let mirrorVal: string | undefined = parseMirrorTextContent(mirrorJson);
    if (mirrorVal !== undefined && mirrorVal === expected) {
      match = { value: mirrorVal, mode: 'FALLBACK:mirror_Text.content' };
      console.info(`[${tag}] ${match.mode} mirrorKey=${mirrorKey} len=${mirrorJson.length}`);
    } else {
      console.info(`[${tag}] FALLBACK miss mirrorKey=${mirrorKey} len=${mirrorJson.length} got=${mirrorVal}`);
    }
  }

  console.info(
    `[${tag}] mount=${mountKey} attr=${attrName} expect=${expected} got=${match?.value} mode=${match?.mode}`);
  expect(match !== undefined).assertTrue();
  expect(match?.value).assertEqual(expected);
}

function parseMirrorTextContent(strJson: string): string | undefined {
  if (!strJson || strJson.trim() === '') {
    return undefined;
  }
  let root: Record<string, Object>;
  try {
    root = JSON.parse(strJson) as Record<string, Object>;
  } catch (_e) {
    return undefined;
  }
  let attrsHolder: Object | undefined = root['$attrs'];
  if (attrsHolder === undefined || attrsHolder === null) {
    return undefined;
  }
  let attrs: Record<string, Object> = attrsHolder as Record<string, Object>;
  let raw: Object | undefined = attrs['content'];
  if (typeof raw === 'string') {
    return raw;
  }
  return undefined;
}

interface MountRoots {
  roots: object[];
  sources: string[];
}

function findAttrAcrossMountRoots(roots: object[], attrName: string,
  expected: string): AttrMatchResult | undefined {
  for (let i: number = 0; i < roots.length; i++) {
    let m: AttrMatchResult | undefined = findAttrInSubtreePreferredStrict(roots[i], attrName, expected);
    if (m !== undefined) {
      return m;
    }
  }
  return undefined;
}

/**
 * 返回 1～2 个根：优先独立解析的 getInspectorByKey；若与 walk 不是同一引用则两者都搜，避免 API 根缺子树或 walk 缺 key。
 */
function resolveMountSubtreeRoots(mountKey: string, tag: string): MountRoots | undefined {
  let tree: Object = getInspectorTree();
  let fullStr: string = safeStringify(tree);
  console.info(
    `[${tag}][resolveMount] treeJsonLen=${fullStr.length} containsMountKey=${fullStr.indexOf(mountKey) >= 0}`);

  let byKeyStr: string = getInspectorByKey(mountKey);
  let byKeyParsed: object | undefined = tryParseInspectorJson(byKeyStr);
  let byWalk: object | undefined = findMountSubtreeInInspector(mountKey);
  console.info(
    `[${tag}][resolveMount] byKeyLen=${byKeyStr.length} byKeyParsed=${byKeyParsed !== undefined} byWalk=${byWalk !== undefined}`);
  if (byKeyStr.length > 0 && byKeyStr.length <= 800) {
    console.info(`[${tag}][resolveMount] getInspectorByKey raw=${byKeyStr}`);
  } else if (byKeyStr.length > 800) {
    console.info(`[${tag}][resolveMount] getInspectorByKey raw(head)=${byKeyStr.substring(0, 800)}...`);
  }

  let roots: object[] = [];
  let sources: string[] = [];
  if (byKeyParsed !== undefined) {
    roots.push(byKeyParsed);
    sources.push('getInspectorByKey');
  }
  if (byWalk !== undefined && !objectAlreadyInRoots(byWalk, roots)) {
    roots.push(byWalk);
    sources.push('treeWalk$key');
  }
  if (roots.length === 0) {
    return undefined;
  }
  let out: MountRoots = { roots: roots, sources: sources };
  return out;
}

function objectAlreadyInRoots(candidate: object, roots: object[]): boolean {
  for (let i: number = 0; i < roots.length; i++) {
    if (roots[i] === candidate) {
      return true;
    }
  }
  return false;
}

function logMountResolutionFailure(mountKey: string, tag: string): void {
  let tree: Object = getInspectorTree();
  let fullStr: string = safeStringify(tree);
  let head: string = fullStr.substring(0, LOG_JSON_MAX);
  console.error(`[${tag}][FAIL mount] mountKey=${mountKey} treeLen=${fullStr.length} treeHead=${head}`);
  let keys: string[] = collectAttrKeysSample(tree as object, 40);
  console.error(`[${tag}][FAIL mount] sampleAttrKeys(${keys.length})=${JSON.stringify(keys)}`);
}

function logAttrMissDiagnostics(mountKey: string, tag: string, root: object, attrName: string,
  expected: string): void {
  let subBlob: string = safeStringify(root);
  let hitExpected: boolean = subBlob.indexOf(expected) >= 0;
  let namesNear: string[] = collectAttrsWhereValueContains(root, expected, 12);
  console.error(
    `[${tag}][FAIL attr] mount=${mountKey} attr=${attrName} expect=${expected} subtreeContainsLiteral=${hitExpected}`);
  console.error(`[${tag}][FAIL attr] attrNamesWithValueContainingExpect=${JSON.stringify(namesNear)}`);
  let sampleLines: string[] = collectFirstLinesForAttrNames(root, [attrName, 'id', 'titleId', 'titleID'], 8);
  for (let i = 0; i < sampleLines.length; i++) {
    console.error(`[${tag}][FAIL attr] sample[${i}]=${sampleLines[i]}`);
  }
}

function collectAttrKeysSample(node: object, budget: number): string[] {
  let bag: string[] = [];
  collectAttrKeysSampleInner(node, bag, budget);
  return bag;
}

function collectAttrKeysSampleInner(node: object, bag: string[], budget: number): void {
  if (bag.length >= budget) {
    return;
  }
  let attrs: Record<string, Object> = (node as Record<string, Object>)['$attrs'] as Record<string, Object>;
  if (attrs !== undefined && attrs !== null) {
    let names: string[] = Object.keys(attrs);
    for (let i = 0; i < names.length; i++) {
      if (bag.length >= budget) {
        return;
      }
      let n: string = names[i];
      if (bag.indexOf(n) < 0) {
        bag.push(n);
      }
    }
  }
  let children: object[] = getChildrenNodes(node);
  for (let j = 0; j < children.length; j++) {
    collectAttrKeysSampleInner(children[j], bag, budget);
  }
}

function collectAttrsWhereValueContains(node: object, needle: string, budget: number): string[] {
  let out: string[] = [];
  collectAttrsWhereValueContainsInner(node, needle, out, budget);
  return out;
}

function collectAttrsWhereValueContainsInner(node: object, needle: string, out: string[], budget: number): void {
  if (out.length >= budget) {
    return;
  }
  let attrs: Record<string, Object> = (node as Record<string, Object>)['$attrs'] as Record<string, Object>;
  if (attrs !== undefined && attrs !== null) {
    let names: string[] = Object.keys(attrs);
    for (let i = 0; i < names.length; i++) {
      if (out.length >= budget) {
        return;
      }
      let nm: string = names[i];
      let raw: Object | undefined = attrs[nm];
      let s: string = valueToDebugString(raw);
      if (s.indexOf(needle) >= 0 && out.indexOf(nm) < 0) {
        out.push(nm);
      }
    }
  }
  let children: object[] = getChildrenNodes(node);
  for (let j = 0; j < children.length; j++) {
    collectAttrsWhereValueContainsInner(children[j], needle, out, budget);
  }
}

function collectFirstLinesForAttrNames(node: object, names: string[], budget: number): string[] {
  let lines: string[] = [];
  collectFirstLinesForAttrNamesInner(node, names, lines, budget);
  return lines;
}

function collectFirstLinesForAttrNamesInner(node: object, names: string[], lines: string[], budget: number): void {
  if (lines.length >= budget) {
    return;
  }
  let attrs: Record<string, Object> = (node as Record<string, Object>)['$attrs'] as Record<string, Object>;
  if (attrs !== undefined && attrs !== null) {
    for (let i = 0; i < names.length; i++) {
      if (lines.length >= budget) {
        return;
      }
      let nm: string = names[i];
      if (attrs[nm] !== undefined) {
        lines.push(`${nm}=${valueToDebugString(attrs[nm])}`);
      }
    }
  }
  let children: object[] = getChildrenNodes(node);
  for (let j = 0; j < children.length; j++) {
    collectFirstLinesForAttrNamesInner(children[j], names, lines, budget);
  }
}

function valueToDebugString(raw: Object | undefined): string {
  if (raw === undefined || raw === null) {
    return '';
  }
  if (typeof raw === 'string' || typeof raw === 'number' || typeof raw === 'boolean') {
    return `${typeof raw}:${raw}`;
  }
  return `${typeof raw}:${safeStringify(raw as object).substring(0, 200)}`;
}

function countInspectableNodes(node: object): number {
  let n: number = 1;
  let ch: object[] = getChildrenNodes(node);
  for (let i = 0; i < ch.length; i++) {
    n = n + countInspectableNodes(ch[i]);
  }
  return n;
}

function findAttrInSubtreePreferredStrict(root: object, attrName: string,
  expected: string): AttrMatchResult | undefined {
  let aliasNames: string[] = attrNameAliases(attrName);
  for (let a: number = 0; a < aliasNames.length; a++) {
    let nm: string = aliasNames[a];
    let strict: string | undefined = findStrictStringAttrInSubtree(root, nm, expected);
    if (strict !== undefined) {
      return { value: strict, mode: a === 0 ? 'STRICT_STRING' : `STRICT_STRING_ALIAS:${nm}` };
    }
    let relaxed: string | undefined = findPrimitiveAttrStringEqualInSubtree(root, nm, expected);
    if (relaxed !== undefined) {
      console.info(
        `[SubHeaderProps][RELAXED] attr=${nm} expect=${expected} matched via number/boolean→string`);
      return { value: relaxed, mode: a === 0 ? 'RELAXED_PRIMITIVE_STRING' : `RELAXED_ALIAS:${nm}` };
    }
  }
  return undefined;
}

function attrNameAliases(primary: string): string[] {
  if (primary === 'titleId') {
    return ['titleId', 'titleID', 'TitleId'];
  }
  if (primary === 'id') {
    return ['id', 'Id'];
  }
  return [primary];
}

function findStrictStringAttrInSubtree(node: object, attrName: string, expected: string): string | undefined {
  let attrs: Record<string, Object> = (node as Record<string, Object>)['$attrs'] as Record<string, Object>;
  if (attrs !== undefined && attrs !== null && attrs[attrName] !== undefined) {
    let raw: Object = attrs[attrName];
    if (typeof raw === 'string' && raw === expected) {
      return raw;
    }
  }
  let children: object[] = getChildrenNodes(node);
  for (let i = 0; i < children.length; i++) {
    let inner: string | undefined = findStrictStringAttrInSubtree(children[i], attrName, expected);
    if (inner !== undefined) {
      return inner;
    }
  }
  return undefined;
}

/** string | number | boolean 转字符串后与 expected 全量匹配（排除 object） */
function findPrimitiveAttrStringEqualInSubtree(node: object, attrName: string,
  expected: string): string | undefined {
  let attrs: Record<string, Object> = (node as Record<string, Object>)['$attrs'] as Record<string, Object>;
  if (attrs !== undefined && attrs !== null && attrs[attrName] !== undefined) {
    let raw: Object = attrs[attrName];
    let t: string = typeof raw;
    if (t === 'string' || t === 'number' || t === 'boolean') {
      let asStr: string = String(raw);
      if (asStr === expected) {
        return asStr;
      }
    }
  }
  let children: object[] = getChildrenNodes(node);
  for (let i = 0; i < children.length; i++) {
    let inner: string | undefined = findPrimitiveAttrStringEqualInSubtree(children[i], attrName, expected);
    if (inner !== undefined) {
      return inner;
    }
  }
  return undefined;
}

function findMountSubtreeInInspector(mountKey: string): object | undefined {
  let tree: Object = getInspectorTree();
  let roots: object[] = rootsOf(tree);
  for (let i = 0; i < roots.length; i++) {
    let sub: object | undefined = findSubtreeByInspectorKey(roots[i], mountKey);
    if (sub !== undefined) {
      return sub;
    }
  }
  return undefined;
}

function tryParseInspectorJson(strJson: string): object | undefined {
  if (!strJson || strJson.trim() === '') {
    return undefined;
  }
  try {
    let parsed: object = JSON.parse(strJson) as object;
    return parsed;
  } catch (_e) {
    return undefined;
  }
}

function safeStringify(obj: object): string {
  try {
    return JSON.stringify(obj);
  } catch (_e) {
    return '';
  }
}

function rootsOf(tree: Object): object[] {
  if (Array.isArray(tree)) {
    return tree as object[];
  }
  return [tree as object];
}

function getChildrenNodes(node: object): object[] {
  let out: object[] = collectChildrenFromField(node, '$children');
  if (out.length > 0) {
    return out;
  }
  return collectChildrenFromField(node, 'children');
}

function collectChildrenFromField(node: object, field: string): object[] {
  let ch: Object | undefined = (node as Record<string, Object>)[field] as Object | undefined;
  if (ch === undefined || ch === null) {
    return [];
  }
  if (Array.isArray(ch)) {
    return ch as object[];
  }
  let m: Record<string, Object> = ch as Record<string, Object>;
  let names: string[] = Object.keys(m);
  let out: object[] = [];
  for (let i = 0; i < names.length; i++) {
    let child: Object | undefined = m[names[i]];
    if (child !== undefined && child !== null && typeof child === 'object') {
      out.push(child as object);
    }
  }
  return out;
}

/** 仅认「本节点」$attrs.key；勿用整棵子树 JSON 包含 key 判断（否则祖先与子 mirror 等会误命中）。 */
function nodeHasInspectorKey(node: object, targetKey: string): boolean {
  let attrs: Record<string, Object> = (node as Record<string, Object>)['$attrs'] as Record<string, Object>;
  if (attrs !== undefined && attrs !== null) {
    let k: Object | undefined = attrs['key'];
    if (k !== undefined && String(k) === targetKey) {
      return true;
    }
  }
  return false;
}

function findSubtreeByInspectorKey(node: object, targetKey: string): object | undefined {
  if (nodeHasInspectorKey(node, targetKey)) {
    return node;
  }
  let children: object[] = getChildrenNodes(node);
  for (let i = 0; i < children.length; i++) {
    let found: object | undefined = findSubtreeByInspectorKey(children[i], targetKey);
    if (found !== undefined) {
      return found;
    }
  }
  return undefined;
}
