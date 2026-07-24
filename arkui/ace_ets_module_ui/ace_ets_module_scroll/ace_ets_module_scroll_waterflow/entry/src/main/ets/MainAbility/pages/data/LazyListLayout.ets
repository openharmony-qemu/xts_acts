/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { LayoutConstraint, LazyLayoutHelper, LazyLayoutAlgorithm, LazyCustomLayoutAlgorithm, ExpandMode, ChildrenCountMode,
  LazyLayoutDirection, LazyCustomLayoutAlgorithmOptions} from '@kit.ArkUI'

export class LazyListLayout extends LazyCustomLayoutAlgorithm {
  private itemHeight: number = 150
  private totalHeight: number = 0;
  private childCnt:number = 0;
  private startIndex: number = -1;
  private endIndex: number = -1;
  private space: number = 0;
  private prevSpace: number = 0;
  private selfNode?: FrameNode;

  constructor(itemHeight: number,option?: LazyCustomLayoutAlgorithmOptions) {
    super({axis: Axis.Vertical})
    this.itemHeight = itemHeight
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
    this.childCnt = self.getChildrenCount(ChildrenCountMode.ALL_NOT_EXPAND);
    this.selfNode = self
    if (!helper) {
      this.measureAllChildren(self, constraint);
      self.setMeasuredSize({ width: constraint.maxSize.width, height: this.totalHeight });
      this.prevSpace = this.space
      return;
    }

    let viewStart = helper.getViewStart();
    let viewEnd = helper.getViewEnd();
    let prevTotalHeight = this.totalHeight
    this.totalHeight = Math.max(this.childCnt * (this.itemHeight + this.space) - this.space, 0);
    if (helper.getLazyLayoutDirection() == LazyLayoutDirection.FORWARD) {
      if (this.startIndex > 0 && this.startIndex < this.childCnt && this.prevSpace != this.space) {
        let adjustStartOffset = this.startIndex * (this.prevSpace - this.space);
        console.info(`Top setAdjustOffset:${adjustStartOffset}`)
        helper.setAdjustedOffset(adjustStartOffset);
        viewStart -= adjustStartOffset;
        viewEnd -= adjustStartOffset;
      }
    } else if (helper.getLazyLayoutDirection() == LazyLayoutDirection.BACKWARD) {
      if (this.endIndex >= 0 && this.endIndex < this.childCnt - 1 && this.prevSpace != this.space) {
        let adjustStartOffset = this.endIndex * (this.prevSpace - this.space);
        let adjustEndOffset = this.totalHeight - prevTotalHeight - adjustStartOffset;
        console.info(`Bottom setAdjustOffset:${adjustEndOffset}`)
        helper.setAdjustedOffset(adjustEndOffset);
        viewStart -= adjustStartOffset;
        viewEnd -= adjustStartOffset;
      }
    }
    this.prevSpace = this.space

    if (viewStart > this.totalHeight || viewEnd < 0 || this.childCnt == 0) {
      this.startIndex = -1;
      this.endIndex = -1;
      this.totalHeight = Math.max(this.childCnt * (this.itemHeight + this.space) - this.space, 0);
      self.setMeasuredSize({ width: constraint.maxSize.width, height: this.totalHeight });
      return;
    }

    let prevStartIndex = this.startIndex;
    let prevEndIndex = this.endIndex;
    this.startIndex = Math.floor(viewStart / (this.itemHeight + this.space))
    this.startIndex = Math.max(this.startIndex, 0);
    this.endIndex = Math.floor(viewEnd / (this.itemHeight + this.space))
    this.endIndex = Math.min(this.endIndex, this.childCnt - 1);

    for (let i = this.startIndex; i <= this.endIndex; i++) {
      let child = self.getChild(i, ExpandMode.LAZY_NOT_EXPAND);
      if (child) {
        child.measure(constraint);
      } else {
        console.error(`Get child[${i}] error`);
      }
    }

    let recycleList:number[] =[]
    if (prevStartIndex < this.startIndex) {
      for (let i = prevStartIndex; i < this.startIndex; i++) {
        recycleList.push(i);
      }
    }
    if (prevEndIndex > this.endIndex) {
      for (let i = this.endIndex + 1; i <= prevEndIndex; i++) {
        recycleList.push(i);
      }
    }
    helper.setChildrenInactive(recycleList)
    self.setMeasuredSize({ width: constraint.maxSize.width, height: this.totalHeight });
  }

  private measureAllChildren(self: FrameNode, constraint: LayoutConstraint): void {
    for (let i = 0; i < this.childCnt; i++) {
      let child = self.getChild(i, ExpandMode.LAZY_NOT_EXPAND);
      if (child) {
        child.measure(constraint);
      } else {
        console.error(`Get child[${i}] error`);
      }
    }

    this.startIndex = 0;
    this.endIndex = this.childCnt - 1;
    this.totalHeight = Math.max(this.childCnt * (this.itemHeight + this.space) - this.space, 0);
  }

  onLayout(self: FrameNode): void {
    if (this.childCnt == 0) {
      return;
    }
    for (let i = this.startIndex; i <= this.endIndex; i++) {
      let child = self.getChild(i, ExpandMode.LAZY_NOT_EXPAND);

      child?.layout({x: 0, y: i * (this.itemHeight + this.space) });
    }
  }
}