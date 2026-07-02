'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  LayoutConstraint,
  ExpandMode,
  ChildrenCountMode,
  FrameNode,
  NodePosition,
  Axis
} from '@kit.ArkUI'
import {
  LazyLayoutHelper,
  LazyCustomLayoutAlgorithm,
  LazyLayoutDirection,
  LazyCustomLayoutAlgorithmOptions
} from '@ohos.arkui.lazyLayoutAlgorithm'

export interface ItemPos {
  start: number;
  end: number;
}

declare interface LazyLayoutInfo {
  viewStart: number;
  viewEnd: number;
}

export class LazyListLayout extends LazyCustomLayoutAlgorithm {
  private itemArr: ItemPos[] = [];
  private itemArrStartIndex: int = -1;
  private estimateItemHeight: number = -1;
  private totalHeight: number = 0;
  private childCnt:int = 0;
  private startIndex: int = -1;
  private endIndex: int = -1;
  private space: number = 0;
  private selfNode?: FrameNode;
  private prevSpace: number = 0;

  constructor(option?: LazyCustomLayoutAlgorithmOptions) {
    super({axis: Axis.Vertical})
  }

  setSpace(value: number): void {
    if (this.space == value) {
      return;
    }
    console.info(`setSpace:${value}`)
    this.prevSpace = this.space;
    this.space = value;
    this.selfNode?.setNeedsLayout()
  }

  getSpace(): number {
    return this.space;
  }

  onMeasure(self: FrameNode, constraint: LayoutConstraint, helper?: LazyLayoutHelper): void {
    console.info(`LazyCustomLayout:constraint:${constraint}, helper:${JSON.stringify(helper)}`)
    this.childCnt = self.getChildrenCount(ChildrenCountMode.ALL_NOT_EXPAND);
    this.selfNode = self
    if (!helper) {
      this.measureAllChildren(self, constraint);
      self.setMeasuredSize({ width: constraint.maxSize.width, height: this.totalHeight });
      this.prevSpace = this.space
      return;
    }

    if (this.childCnt == 0) {
      this.clearMeasureState();
      self.setMeasuredSize({ width: constraint.maxSize.width, height: 0 });
      return;
    }

    let viewStart = helper.getViewStart();
    let viewEnd = helper.getViewEnd();
    console.info(`LazyCustomLayout:viewStart:${viewStart}, viewEnd:${viewEnd}`)
    let prevTotalHeight = this.totalHeight
    let anchorIndex = -1;
    let anchorPos: number = 0;

    if (helper.getLazyLayoutDirection() === LazyLayoutDirection.FORWARD) {
      if (this.startIndex > 0 && this.startIndex < this.childCnt) {
        anchorIndex = this.startIndex;
        anchorPos = this.itemArr[anchorIndex + this.itemArrStartIndex].start;
      }
    } else {
      if (this.endIndex >= 0 && this.endIndex < this.childCnt - 1) {
        anchorIndex = this.endIndex;
        anchorPos = prevTotalHeight - this.itemArr[anchorIndex + this.itemArrStartIndex].end;
      }
    }
    console.info(`LazyCustomLayout:anchorIndex:${anchorIndex}, anchorPos:${anchorPos}`)

    let startIndex = this.startIndex;
    let endIndex = this.endIndex;

    this.measureInViewRange(self, constraint, helper);
    console.info(`YYL:startIndex:${this.startIndex}, endIndex:${this.endIndex}, prevS:${startIndex},prevend:${endIndex}`)
    let recycleList: int[] = []
    if (startIndex < this.startIndex) {
      for (let i = startIndex; i < this.startIndex; i++) {
        recycleList.push(i);
      }
    }
    if (endIndex > this.endIndex) {
      for (let i = this.endIndex + 1; i <= endIndex; i++) {
        recycleList.push(i);
      }
    }
    helper.setChildrenInactive(recycleList)

    if (anchorIndex >= 0) {
      if (helper.getLazyLayoutDirection() === LazyLayoutDirection.FORWARD) {
        let newPos = this.itemArr[anchorIndex + this.itemArrStartIndex].start;
        if (newPos !== anchorPos) {
          console.info(`LazyCustomLayout:setAdjustedOffset:${anchorPos}  newPos:${newPos}`)
          helper.setAdjustedOffset((anchorPos - newPos).toInt());
        }
      } else {
        let newPos = this.totalHeight - this.itemArr[anchorIndex + this.itemArrStartIndex].end;
        if (newPos !== anchorPos) {
          console.info(`LazyCustomLayout:setAdjustedOffset1:${newPos - anchorPos}`)
          helper.setAdjustedOffset((newPos - anchorPos).toInt());
        }
      }
    }

    console.info(`LazyCustomLayout:setMeasuredSize:${this.totalHeight}, start:${this.startIndex} end:${this.endIndex}`)
    self.setMeasuredSize({ width: constraint.maxSize.width, height: this.totalHeight });
  }

  private clearMeasureState(): void {
    this.itemArr.length = 0;
    this.totalHeight = 0;
    this.startIndex = -1;
    this.endIndex = -1;
  }

  private measureAllChildren(self: FrameNode, constraint: LayoutConstraint): void {
    this.itemArr = [];
    this.itemArrStartIndex = 0;
    let currPos = 0;

    for (let i = 0; i < this.childCnt; i++) {
      let child = self.getChild(i, ExpandMode.LAZY_NOT_EXPAND);
      if (child) {
        child.measure(constraint);
        let itemHeight = child.getMeasuredSize().height;
        this.itemArr.push({
          start: currPos,
          end: currPos + itemHeight,
        });
        currPos += itemHeight;
        if (i < this.childCnt - 1) {
          currPos += this.space;
        }
      } else {
        console.error(`Get child[${i}] error`);
      }
    }

    this.startIndex = 0;
    this.endIndex = this.childCnt - 1;

    if (this.itemArr.length > 0) {
      this.totalHeight = this.itemArr[this.itemArr.length - 1].end;
    } else {
      this.totalHeight = 0;
      this.estimateItemHeight = -1;
    }
  }

  private measureInViewRange(
    self: FrameNode,
    constraint: LayoutConstraint,
    helper: LazyLayoutHelper
  ): void {
    let currIndex: int = 0;
    let currPos: number = 0;

    if (this.itemArrStartIndex >= 0 && this.itemArr.length > 0) {
      currIndex = this.findStartIndex(helper.getViewStart());

      // 确定数组索引是否在有效范围内
      const arrayIndex = currIndex - this.itemArrStartIndex;

      if (arrayIndex >= 0 && arrayIndex < this.itemArr.length) {
        // 在范围内：使用已有元素位置
        currPos = this.itemArr[arrayIndex].start;
      } else if (arrayIndex >= this.itemArr.length) {
        // 超出范围：使用估算位置（最后一个元素之后）
        const lastItem = this.itemArr[this.itemArr.length - 1];
        currPos = lastItem.end + this.space;

        if (LazyListLayout.DEBUG_MERGE) {
          console.info(`[measureInViewRange] currIndex超出范围，估算位置: ${currPos}px`);
        }
      } else {
        // 异常情况：arrayIndex < 0
        currPos = 0;
        console.error(`[measureInViewRange] ERROR: arrayIndex=${arrayIndex} < 0`);
      }
    } else if (helper.getLazyLayoutDirection() == LazyLayoutDirection.BACKWARD) {
      currIndex = this.childCnt - 1;
      currPos = this.totalHeight;
    } else {
      // 初始状态：从头开始测量
      currIndex = 0;
      currPos = 0;
    }

    let startIndex = currIndex;
    let startPos = currPos;
    let tmpItemArr: ItemPos[] = [];
    let tmpItemArrStartIndex: int = Int.MAX_VALUE;

    tmpItemArrStartIndex = this.measureForward(
      self, constraint, helper, currIndex, currPos, tmpItemArr
    );

    if (startPos - this.space > helper.getViewStart()) {
      tmpItemArrStartIndex = this.measureBackward(
        self, constraint, helper, startIndex, startPos, tmpItemArr, tmpItemArrStartIndex
      );
    }

    if (tmpItemArr.length <= 0) {
      console.error(`No Child measured`);
      this.startIndex = -1;
      this.endIndex = -1;
      return;
    }

    this.startIndex = tmpItemArrStartIndex;
    this.endIndex = tmpItemArrStartIndex + tmpItemArr.length - 1;

    this.flushSpaceChange();


    // Call merge function
    this.merge(tmpItemArrStartIndex, tmpItemArr);


    console.info('merge completed, continuing with subsequent operations...\n');

    this.updateTotalHeight();
  }

  private measureForward(
    self: FrameNode,
    constraint: LayoutConstraint,
    helper: LazyLayoutHelper,
    startIndex: int,
    startPos: number,
    tmpItemArr: ItemPos[]
  ): int {
    let currIndex = startIndex;
    let currPos = startPos;
    let tmpItemArrStartIndex: int = Int.MAX_VALUE;

    for (; currIndex < this.childCnt; currIndex++) {
      let child = self.getChild(currIndex, ExpandMode.LAZY_NOT_EXPAND);
      if (child) {
        child.measure(constraint);
        let itemHeight = child.getMeasuredSize().height;
        tmpItemArrStartIndex = currIndex < tmpItemArrStartIndex ? currIndex : tmpItemArrStartIndex;
        console.info(`YYL:currIndex:${currIndex},tmpItemArrStartIndex:${tmpItemArrStartIndex}, ${tmpItemArr.length}`)
        tmpItemArr.push({
          start: currPos,
          end: currPos + itemHeight,
        });
        currPos += itemHeight;
        if (currIndex < this.childCnt - 1) {
          currPos += this.space;
        }
      } else {
        console.error(`Get child[${currIndex}] error`);
      }

      if (currPos > helper.getViewEnd()) {
        break;
      }
    }

    return tmpItemArrStartIndex;
  }

  private measureBackward(
    self: FrameNode,
    constraint: LayoutConstraint,
    helper: LazyLayoutHelper,
    startIndex: int,
    startPos: number,
    tmpItemArr: ItemPos[],
    tmpItemArrStartIndex: int
  ): int {
    let currPos = startPos;
    let currIndex = startIndex - 1;

    for (; currIndex >= 0; currIndex--) {
      let child = self.getChild(currIndex, ExpandMode.LAZY_NOT_EXPAND);
      if (child) {
        child.measure(constraint);
        let itemHeight = child.getMeasuredSize().height;
        tmpItemArrStartIndex = currIndex < tmpItemArrStartIndex ? currIndex : tmpItemArrStartIndex;
        currPos -= this.space;
        tmpItemArr.unshift({
          start: currPos - itemHeight,
          end: currPos,
        });
        currPos -= itemHeight;
      } else {
        console.error(`LazyCustomLayout:Get child[${currIndex}] error`);
      }

      if (currPos < helper.getViewStart()) {
        break;
      }
    }

    return tmpItemArrStartIndex;
  }

  private updateTotalHeight(): void {
    const endIndex = this.itemArrStartIndex + this.itemArr.length;
    const endPos = this.itemArr[this.itemArr.length - 1].end;

    if (this.childCnt > endIndex) {
      // 当还有未测量的元素时，需要考虑间距
      // 每个剩余元素包含：元素高度 + 间距
      const remainingItems = this.childCnt - endIndex;
      this.totalHeight = endPos + remainingItems * (this.estimateItemHeight + this.space);
    } else {
      this.totalHeight = endPos;
    }
  }

  onLayout(self: FrameNode, position: NodePosition): void {
    console.info(`LazyCustomLayout:onLayout`)
    if (this.childCnt == 0) {
      return;
    }
    for (let i = this.startIndex; i <= this.endIndex; i++) {
      let child = self.getChild(i, ExpandMode.LAZY_NOT_EXPAND);

      child?.layout({x: 0, y: this.itemArr[i - this.itemArrStartIndex].start });
    }
  }

  flushSpaceChange(): void {
    // 如果间距没有变化或者没有测量数据，直接返回
    if (this.prevSpace === this.space || this.itemArr.length === 0) {
      return;
    }

    // 计算间距差异
    const spaceDiff = this.space - this.prevSpace;

    // 调整每个元素的位置
    // itemArr[i] 表示第 个实际元素
    // 该元素之前有 actualIndex 个间距（元素0到元素actualIndex-1之间）
    // 当 space 改变时，元素位置需要调整 actualIndex * spaceDiff
    for (let i = 0; i < this.itemArr.length; i++) {
      const actualIndex = this.itemArrStartIndex + i;
      const posDiff = actualIndex * spaceDiff;
      this.itemArr[i].start += posDiff;
      this.itemArr[i].end += posDiff;
    }

    // 更新 totalHeight
    // 总高度中包含 个间距，需要调整间距差异
    if (this.childCnt > 1) {
      this.totalHeight += spaceDiff * (this.childCnt - 1);
    }

    // 标记间距变化已处理完毕
    this.prevSpace = this.space;
  }
  // OPTIMIZED: 使用双指针归并算法，一次遍历完成合并
  // 调试标志（生产环境设置为false）
  private static readonly DEBUG_MERGE = false;

  // 将增量数据更新到startIndex和itemArr中，deltaStartIndex表示deltaItemArr起始索引号
  // 更新完成后，确保itemArr中前一项数据的end和后一项数据的start相同。
  // 如果增量元素和已有元素有空隙，则生成大小为estimateSize的元素填充。
  merge(deltaStartIndex: int, deltaItemArr: ItemPos[]): void {
    // 快速参数检查
    if (!deltaItemArr || deltaItemArr.length === 0) {
      return;
    }

    // 特殊场景：当前无数据，直接使用增量数据
    if (this.itemArr.length === 0) {
      this.itemArrStartIndex = deltaStartIndex;
      this.itemArr = [...deltaItemArr];

      // 计算平均元素高度
      if (deltaItemArr.length > 0) {
        let totalSize = 0;
        for (const item of deltaItemArr) {
          totalSize += (item.end - item.start);
        }
        this.estimateItemHeight = totalSize / deltaItemArr.length;
      }

      // 执行约束调整
      this.enforceConstraint();
      return;
    }

    // 预计算关键参数
    const deltaOffset = deltaStartIndex - this.itemArrStartIndex;
    const deltaEndIndex = deltaStartIndex + deltaItemArr.length - 1;
    const currentEndIndex = this.itemArrStartIndex + this.itemArr.length - 1;

    // 判断合并场景类型
    const completelyAfter = deltaStartIndex >= currentEndIndex + 1;  // delta完全在current之后
    const completelyBefore = deltaEndIndex < this.itemArrStartIndex; // delta完全在current之前
    const hasOverlap = !(completelyAfter || completelyBefore);       // 是否有重叠

    // 判断是否应该填充空隙
    let shouldFillGap = completelyAfter || completelyBefore;  // 前提：完全分离

    // 额外判断：前置场景下，如果delta最后一个元素与current第一个元素间距太小，不填充
    if (completelyBefore && this.itemArr.length > 0 && deltaItemArr.length > 0) {
      const lastDeltaEnd = deltaItemArr[deltaItemArr.length - 1].end;
      const firstCurrentStart = this.itemArr[0].start;
      const actualGap = firstCurrentStart - lastDeltaEnd;
      // 只有间距大于一个完整元素（estimateHeight + space）才填充
      if (actualGap <= this.space + this.estimateItemHeight) {
        shouldFillGap = false;
      }
    }

    // 后置场景的类似判断
    if (completelyAfter && this.itemArr.length > 0 && deltaItemArr.length > 0) {
      const lastCurrentEnd = this.itemArr[this.itemArr.length - 1].end;
      const firstDeltaStart = deltaItemArr[0].start;
      const actualGap = firstDeltaStart - lastCurrentEnd;
      if (actualGap <= this.space + this.estimateItemHeight) {
        shouldFillGap = false;
      }
    }

    // 计算最终数组的覆盖范围（考虑是否填充空隙）
    const finalStartIndex = this.itemArrStartIndex < deltaStartIndex ? this.itemArrStartIndex : deltaStartIndex;
    const finalEndIndex = currentEndIndex > deltaEndIndex ? currentEndIndex : deltaEndIndex;

    // 构建结果数组
    const result: ItemPos[] = [];
    let prevEnd = -Infinity;  // 记录前一个元素的end位置

    // 单次遍历完成所有逻辑
    for (let actualIndex = finalStartIndex; actualIndex <= finalEndIndex; actualIndex++) {
      // 确定当前索引的数据来源
      const inCurrentRange = actualIndex >= this.itemArrStartIndex && actualIndex <= currentEndIndex;
      const inDeltaRange = actualIndex >= deltaStartIndex && actualIndex <= deltaEndIndex;

      let newItem: ItemPos | null = null;

      if (inDeltaRange) {
        // 优先使用增量数据（覆盖现有数据）
        const deltaIdx = actualIndex - deltaStartIndex;
        newItem = { start: deltaItemArr[deltaIdx].start, end: deltaItemArr[deltaIdx].end };
      } else if (inCurrentRange) {
        // 使用现有数据
        const currentIdx = actualIndex - this.itemArrStartIndex;
        newItem = { start: this.itemArr[currentIdx].start, end: this.itemArr[currentIdx].end };
      } else if (shouldFillGap && this.estimateItemHeight > 0) {
        // 空隙且应该填充：创建估算元素
        const start = prevEnd + this.space;
        newItem = { start: start, end: start + this.estimateItemHeight };
      }
      // else: 不填充空隙，跳过此索引

      if (newItem !== null) {
        // 实时处理重叠：两种场景
        // 1. 索引重叠场景（hasOverlap=true）：实时调整
        // 2. 完全分离场景但位置重叠：也需要调整
        if (result.length > 0) {
          const prevItem = result[result.length - 1];
          const requiredStart = prevItem.end + this.space;

          if (newItem.start < requiredStart) {
            // 检测到重叠，实时调整
            const shiftAmount = requiredStart - newItem.start;
            newItem.start += shiftAmount;
            newItem.end += shiftAmount;

            // 仅在DEBUG模式输出日志
            if (LazyListLayout.DEBUG_MERGE) {
              console.info(`[OVERLAP FIX] Index ${actualIndex}: adjusted by ${shiftAmount}px`);
            }
          }
        }

        // 存入结果数组
        result.push(newItem);
        prevEnd = newItem.end;
      }
    }

    // 更新状态（一次赋值完成）
    this.itemArr = result;
    this.itemArrStartIndex = finalStartIndex;

    // 执行约束检查（确保位置符合理论计算）
    this.enforceConstraint();

    // 移除后置validate遍历（已通过实时调整保证正确性）
    // 仅在DEBUG模式验证
    if (LazyListLayout.DEBUG_MERGE) {
      this.validateAndFixPositions();
    }
  }

  // Validate element positions and fix overlaps - CRITICAL FIX
  private validateAndFixPositions(): void {
    if (this.itemArr.length === 0) {
      return;
    }

    let hasOverlap = false;

    // Check each element pair for overlap
    for (let i = 1; i < this.itemArr.length; i++) {
      const prevItem = this.itemArr[i - 1];
      const currItem = this.itemArr[i];

      // Check if current item overlaps with previous item
      if (currItem.start < prevItem.end) {
        hasOverlap = true;

        console.error(`\n[POSITION VALIDATION] OVERLAP DETECTED at index ${i}`);
        console.error(`  [${i - 1}] [${prevItem.start}, ${prevItem.end}] ends at ${prevItem.end}px`);
        console.error(`  [${i}] [${currItem.start}, ${currItem.end}] starts at ${currItem.start}px`);
        console.error(`  Overlap amount: ${prevItem.end - currItem.start}px`);

        // Fix overlap immediately
        const correctStart = prevItem.end + this.space;
        const height = currItem.end - currItem.start;

        currItem.start = correctStart;
        currItem.end = correctStart + height;

        console.error(`  FIXED: [${i}] now starts at ${correctStart}px`);
      }

      // Check if positions are not monotonic (should always increase)
      else if (currItem.start < prevItem.start) {
        hasOverlap = true;

        console.error(`\n[POSITION VALIDATION] POSITION ORDER ERROR at index ${i}`);
        console.error(`  [${i - 1}] starts at ${prevItem.start}px`);
        console.error(`  [${i}] starts at ${currItem.start}px (BACKWARDS!)`);

        // Fix position order
        const correctStart = prevItem.end + this.space;
        const height = currItem.end - currItem.start;

        currItem.start = correctStart;
        currItem.end = correctStart + height;

        console.error(`  FIXED: [${i}] now starts at ${correctStart}px`);
      }
    }

    if (hasOverlap) {
      console.error(`\n[POSITION VALIDATION] ${this.itemArr.length} elements checked, overlaps fixed`);
    }
  }

  // 确保满足约束：itemArr[0].start 应等于 itemArrStartIndex 个元素的累积高度（包含间距）
  // 如果不满足，保持元素大小不变，调整所有元素的start和end
  private enforceConstraint(): void {
    if (this.itemArr.length > 0 && this.estimateItemHeight > 0) {
      // 计算期望的起始位置，考虑间距
      // 第 itemArrStartIndex 个元素之前有 itemArrStartIndex 个元素
      // 这些元素的总高度为：itemArrStartIndex * estimateItemHeight + (itemArrStartIndex - 1) * space
      const expectedStart = this.itemArrStartIndex > 0
        ? this.itemArrStartIndex * this.estimateItemHeight + (this.itemArrStartIndex - 1) * this.space
        : 0;
      const actualStart = this.itemArr[0].start;
      // 使用浮点数容差比较，避免精度问题
      if (Math.abs(expectedStart - actualStart) > 0.1) {
        const shiftAmount = expectedStart - actualStart;
        // 调整所有元素的start和end
        for (let i = 0; i < this.itemArr.length; i++) {
          this.itemArr[i].start += shiftAmount;
          this.itemArr[i].end += shiftAmount;
        }
      }
    }
  }

  // 使用二分查找找到第一个end > viewStart的索引
  private findStartIndex(viewStart: number): int {
    if (this.itemArr.length === 0) {
      return this.itemArrStartIndex >= 0 ? this.itemArrStartIndex : 0;
    }

    let left: int = 0;
    let right: int = this.itemArr.length - 1;
    let result: int = this.itemArr.length; // 默认返回最后一个索引+1

    // 二分查找第一个满足 itemArr[i].end > viewStart 的索引
    while (left <= right) {
      const mid: int = (left + right) / 2;
      if (this.itemArr[mid] && this.itemArr[mid].end > viewStart) {
        result = mid;
        right = mid - 1; // 继续向左查找更小的索引
      } else {
        left = mid + 1; // 向右查找
      }
    }

    // 返回实际的索引号，确保在有效范围内
    // result 最大为 itemArr.length，对应最后一个元素之后的索引
    // 但访问数组时需要确保索引有效
    const maxValidArrayIndex: int = this.itemArr.length - 1;
    const safeArrayIndex: int = result < maxValidArrayIndex ? result : maxValidArrayIndex;

    return this.itemArrStartIndex + safeArrayIndex;
  }
}
