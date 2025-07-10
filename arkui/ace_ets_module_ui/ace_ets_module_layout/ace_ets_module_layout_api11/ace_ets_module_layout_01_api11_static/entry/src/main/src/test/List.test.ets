/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// import Stack_Text from './Stack_Text/Stack_Text.test';
import grid_colSpanJsunit from './GridColTest/grid_col.test';
import grid_rowOnBreakpointChangeJsunit from './GridRowTest/grid_row.test';
import inspectorJsunit from './inspectorTest/inspector.test';
import Column_Space from './ColumnTest/spaceChanged/Column_Space.test';
import Column_Space_String from './ColumnTest/spaceChanged/Column_Space_String.test';
import Column_Space_Default from './ColumnTest/spaceChanged/Column_Space_Default.test';
import layoutWeight_Part from './ColumnTest/layoutWeight/layoutWeight_Part.test';
import layoutWeight_All from './ColumnTest/layoutWeight/layoutWeight_All.test';
import layoutWeight_Default from './ColumnTest/layoutWeight/layoutWeight_Default.test';
import layoutWeight_flexGrow from './ColumnTest/layoutWeight/layoutWeight_flexGrow.test';
import layoutWeight_flexShrink from './ColumnTest/layoutWeight/layoutWeight_flexShrink.test';
import flexGrow_Part from './ColumnTest/flexGrow/flexGrow_Part.test';
import flexGrow_Default from './ColumnTest/flexGrow/flexGrow_Default.test';
import flexShrink_Part from './ColumnTest/flexShrink/flexShrink_Part.test';
import flexBasis_Type from './ColumnTest/flexBasis/flexBasis_Type.test';
import flexBasis_Default from './ColumnTest/flexBasis/flexBasis_Default.test';
import columnNesting_Space from './ColumnTest/columnNesting/columnNesting_Space.test';
import columnNesting_alignItems from './ColumnTest/columnNesting/columnNesting_alignItems.test';
import columnNesting_justifyContent from './ColumnTest/columnNesting/columnNesting_justifyContent.test';
import column_WidthHeight_ChangeParent from './ColumnTest/ParentComponentChanged/Column_WidthHeight_ChangeParent.test';
import column_Padding_ChangeParent from './ColumnTest/ParentComponentChanged/Column_Padding_ChangeParent.test';
import column_Margin_ChangeParent from './ColumnTest/ParentComponentChanged/Column_Margin_ChangeParent.test';
import column_MarPad_ChangeParent from './ColumnTest/ParentComponentChanged/Column_MarPad_ChangeParent.test';
import column_AlignItems_ChangeParent from './ColumnTest/ParentComponentChanged/Column_AlignItems_ChangeParent.test';
import column_JustifyContent_ChangeParent from './ColumnTest/ParentComponentChanged/Column_JustifyContent_ChangeParent.test';
import ColumnWidthHeight_SubChange from './ColumnTest/subComponentChanged/ColumnWidthHeight_SubChange.test';
import ColumnSetPadding_SubChange from './ColumnTest/subComponentChanged/ColumnSetPadding_SubChange.test';
import ColumnSetPadding_SubChangeMar from './ColumnTest/subComponentChanged/ColumnSetPadding_SubChangeMar.test';
import ColumnSetPadding_SubChangePad from './ColumnTest/subComponentChanged/ColumnSetPadding_SubChangePad.test';
import ColumnSetMargin_SubChange from './ColumnTest/subComponentChanged/ColumnSetMargin_SubChange.test';
import ColumnSetMargin_SubChangeMar from './ColumnTest/subComponentChanged/ColumnSetMargin_SubChangeMar.test';
import ColumnSetMargin_SubChangePad from './ColumnTest/subComponentChanged/ColumnSetMargin_SubChangePad.test';
import ColumnSetPaddingMargin_SubChange from './ColumnTest/subComponentChanged/ColumnSetPaddingMargin_SubChange.test';
import ColumnSetPaddingMargin_SubChangeMar from './ColumnTest/subComponentChanged/ColumnSetPaddingMargin_SubChangeMar.test';
import ColumnSetPaddingMargin_SubChangePad from './ColumnTest/subComponentChanged/ColumnSetPaddingMargin_SubChangePad.test';
import ColumnSetPosition_SubChange from './ColumnTest/subComponentChanged/ColumnSetPosition_SubChange.test';
import ColumnSetOffset_SubChange from './ColumnTest/subComponentChanged/ColumnSetOffset_SubChange.test';
import ColumnSetDisplayPriority_SubChange from './ColumnTest/subComponentChanged/ColumnSetDisplayPriority_SubChange.test';
import ColumnSetLayoutWeight_SubChange from './ColumnTest/subComponentChanged/ColumnSetLayoutWeight_SubChange.test';
import ColumnSetLayoutWeightNone_SubChange from './ColumnTest/subComponentChanged/ColumnSetLayoutWeightNone_SubChange.test';
import ColumnSetFlexShink_SubChange from './ColumnTest/subComponentChanged/ColumnSetFlexShink_SubChange.test';
import ColumnSetFlexShinkNone_SubChange from './ColumnTest/subComponentChanged/ColumnSetFlexShinkNone_SubChange.test';
import ColumnSetVisibility_SubChange from './ColumnTest/subComponentChanged/ColumnSetVisibility_SubChange.test';
import stackAlignChange from './Stack/Stack_change/stackAlignChange.test';
import stackSizeChange from './Stack/Stack_change/stackSizeChange.test';
import stackNoneSettingWidthHeight from './Stack/Stack_change/stackNoneSettingWidthHeight.test';
import stackPaddingChange from './Stack/Stack_change/stackPaddingChange.test';
import stackMarginChange from './Stack/Stack_change/stackMarginChange.test';
import Stack_AlignContent from './Stack/Stack_alignContent/stack_alignContent.test';
import Stack_Offset_Change from './Stack/StackItem_change/stack_offset_change.test';
import Stack_Position_Change from './Stack/StackItem_change/stack_position_change.test';
// import Stack_ZIndex from './Stack/StackItem_change/stack_zIndex.test';
// import StackJsunit from './Stack/StackJsunit.test';
// import StackAlignContentTest from './Stack/StackAlignContentTest.test';


export default function testsuite() {
  // Stack_Text()
  inspectorJsunit()
  Column_Space()
  Column_Space_String()
  Column_Space_Default()
  layoutWeight_Part()
  layoutWeight_All()
  layoutWeight_Default()
  layoutWeight_flexGrow()
  layoutWeight_flexShrink()
  flexGrow_Part()
  flexGrow_Default()
  flexShrink_Part()
  flexBasis_Type()
  flexBasis_Default()
  columnNesting_Space()
  columnNesting_alignItems()
  columnNesting_justifyContent()
  column_WidthHeight_ChangeParent()
  column_Padding_ChangeParent()
  column_Margin_ChangeParent()
  column_MarPad_ChangeParent()
  column_AlignItems_ChangeParent()
  column_JustifyContent_ChangeParent()
  ColumnWidthHeight_SubChange()
  ColumnSetPadding_SubChange()
  ColumnSetPadding_SubChangeMar()
  ColumnSetPadding_SubChangePad()
  ColumnSetMargin_SubChange()
  ColumnSetMargin_SubChangeMar()
  ColumnSetMargin_SubChangePad()
  ColumnSetPaddingMargin_SubChange()
  ColumnSetPaddingMargin_SubChangeMar()
  ColumnSetPaddingMargin_SubChangePad()
  ColumnSetPosition_SubChange()
  ColumnSetOffset_SubChange()
  ColumnSetDisplayPriority_SubChange()
  ColumnSetLayoutWeight_SubChange()
  ColumnSetLayoutWeightNone_SubChange()
  ColumnSetFlexShink_SubChange()
  ColumnSetFlexShinkNone_SubChange()
  ColumnSetVisibility_SubChange()
  stackAlignChange();
  stackSizeChange();
  stackNoneSettingWidthHeight();
  stackPaddingChange();
  stackMarginChange();
  Stack_AlignContent();
  Stack_Offset_Change();
  Stack_Position_Change();
  // Stack_ZIndex();
  // StackJsunit()
  // StackAlignContentTest();
}