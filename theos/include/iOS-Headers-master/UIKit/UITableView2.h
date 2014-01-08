/**
 * This header is generated by class-dump-z 0.1-11o.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 */

#import "NSCoding.h"
#import <UIKit/UITableView.h>
#import "UIKit-Structs.h"
#import <UIKit/UIScrollView.h>
#import <Availability2.h>

@class NSMutableArray, NSIndexPath, NSMutableDictionary, NSArray, UITableViewCell, UIColor;
@protocol UITableViewDelegate, UITableViewDataSource;

@interface UITableView ()
@property(retain, nonatomic) id scrollTestParameters __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_3_1);
// inherited: -(id)initWithFrame:(CGRect)frame;
-(void)_setupTableViewCommon;
-(void)_populateArchivedSubviews:(id)subviews;
// in a protocol: -(id)initWithCoder:(id)coder;
// in a protocol: -(void)encodeWithCoder:(id)coder;
// inherited: -(void)dealloc;
-(void)reloadData;
-(void)reloadSectionIndexTitles;
-(void)noteNumberOfRowsChanged;
-(int)globalRowForRowAtIndexPath:(id)indexPath;
-(id)indexPathForRowAtGlobalRow:(int)globalRow;
-(void)setIndexHiddenForSearch:(BOOL)search;
-(void)setIndexHidden:(BOOL)hidden animated:(BOOL)animated;
-(BOOL)isIndexHidden;
-(CGRect)indexFrame;
-(void)setTableHeaderViewShouldAutoHide:(BOOL)autoHide;
-(BOOL)tableHeaderViewShouldAutoHide;
-(BOOL)overlapsSectionHeaderViews;
-(void)setOverlapsSectionHeaderViews:(BOOL)views;
-(int)numberOfSections;
-(int)numberOfRowsInSection:(int)section;
-(CGRect)rectForSection:(int)section;
-(CGRect)rectForHeaderInSection:(int)section;
-(CGRect)rectForFooterInSection:(int)section;
-(void)beginUpdates;
-(void)endUpdatesWithContext:(id)context;
-(void)endUpdates;
-(id)_arrayForUpdateAction:(int)updateAction;
-(void)_updateSections:(id)sections updateAction:(int)action withRowAnimation:(int)rowAnimation;
-(void)_updateRowsAtIndexPaths:(id)indexPaths updateAction:(int)action withRowAnimation:(int)rowAnimation;
-(BOOL)_isRowMultiSelect:(id)select;
-(BOOL)_shouldHighlightInsteadOfSelectRowAtIndexPath:(id)indexPath;
-(void)highlightRowAtIndexPath:(id)indexPath animated:(BOOL)animated scrollPosition:(int)position;
-(void)unhighlightRowAtIndexPath:(id)indexPath animated:(BOOL)animated;
-(void)_selectRowAtIndexPath:(id)indexPath animated:(BOOL)animated scrollPosition:(int)position notifyDelegate:(BOOL)delegate;
-(void)_userSelectRowAtIndexPath:(id)indexPath;
-(void)setShowsSelectionImmediatelyOnTouchBegin:(BOOL)begin;
-(BOOL)showsSelectionImmediatelyOnTouchBegin;
-(unsigned)maximumNumberOfSectionIndexTitlesWithoutTruncation;
-(void)setBackgroundColor:(id)color;
// inherited: -(BOOL)canHandleSwipes;
// inherited: -(int)swipe:(int)swipe withEvent:(GSEventRef)event;
-(int)swipeCell:(int)cell atPoint:(CGPoint)point;
-(void)handleSwipe:(id)swipe;
-(BOOL)_canSelectRowContainingHitView:(id)view;
-(void)_tableViewDeferredTouchesBegan:(id)began;
-(void)touchesBegan:(id)began withEvent:(id)event;
-(void)touchesMoved:(id)moved withEvent:(id)event;
-(void)_beginTouchesInContentView:(id)contentView touches:(id)touches withEvent:(id)event;
-(void)_updateTableHeaderViewForAutoHide;
// inherited: -(void)handlePan:(id)pan;
// inherited: -(void)touchesEnded:(id)ended withEvent:(id)event;
// inherited: -(void)touchesCancelled:(id)cancelled withEvent:(id)event;
// inherited: -(void)mouseDown:(GSEventRef)down;
// inherited: -(void)mouseDragged:(GSEventRef)dragged;
// inherited: -(void)mouseUp:(GSEventRef)up;
// inherited: -(id)hitTest:(CGPoint)test forEvent:(GSEventRef)event;
// inherited: -(id)hitTest:(CGPoint)test withEvent:(id)event;
// inherited: -(BOOL)touchesShouldCancelInContentView:(id)touches;
-(BOOL)_scrollsToMakeFirstResponderVisible;
-(void)layoutSubviews;
-(void)_rectChangedWithNewSize:(CGSize)newSize oldSize:(CGSize)size;
// inherited: -(void)setFrame:(CGRect)frame;
// inherited: -(void)setBounds:(CGRect)bounds;
-(void)setEditing:(BOOL)editing animated:(BOOL)animated;
// inherited: -(void)setShowsHorizontalScrollIndicator:(BOOL)indicator;
// inherited: -(void)setShowsVerticalScrollIndicator:(BOOL)indicator;
// inherited: -(void)setContentOffset:(CGPoint)offset;
// inherited: -(void)setContentInset:(UIEdgeInsets)inset;
-(NSArray*)indexPathsForSelectedRows;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_3_2
-(id)rowDataDescription;
-(void)_selectAllSelectedRows;
-(void)setSeparatorTopShadowColor:(id)color;
-(id)separatorTopShadowColor;
-(void)setSeparatorBottomShadowColor:(id)color;
-(id)separatorBottomShadowColor;
-(void)setUsesVariableMargins:(BOOL)margins;
-(BOOL)usesVariableMargins;
-(void)_backgroundColorAnimationDidStop;
-(void)_setBackgroundColor:(id)color animated:(BOOL)animated;
-(BOOL)_beginTrackingWithEvent:(id)event;
-(BOOL)_cancelContentTouchWithEvent:(id)event forced:(BOOL)forced;
-(void)_scrollViewDidEndDraggingWithDeceleration:(BOOL)_scrollView;
#else
-(BOOL)_resetScrollingForGestureEvent:(id)gestureEvent;
#endif
@end

@interface UITableView (UITableViewInternal)
-(BOOL)_dataSourceImplementsNumberOfSectionsInTableView;
-(BOOL)_delegateImplementsHeightForRowAtIndexPath;
-(BOOL)_dataSourceImplementsCanUpdateRowAtIndexPath;
-(BOOL)_delegateWantsHeaderForSection:(int)section;
-(BOOL)_delegateWantsCustomHeaderForSection:(int)section;
-(BOOL)_delegateWantsHeaderTitleForSection:(int)section;
-(BOOL)_delegateImplementsHeightForRowsInSection;
-(BOOL)_delegateWantsFooterForSection:(int)section __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_3_1);
-(BOOL)_delegateWantsFooterTitleForSection:(int)section __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_3_1);
-(BOOL)_delegateWantsCustomFooterForSection:(int)section;
-(BOOL)_delegateImplementsHeightForHeaderInSection;
-(BOOL)_delegateImplementsHeightForFooterInSection;
-(BOOL)_dataSourceImplementsTitleForHeaderInSection;
-(BOOL)_dataSourceImplementsTitleForFooterInSection;
-(BOOL)_delegateImplementsViewForHeaderInSection;
-(BOOL)_delegateImplementsViewForFooterInSection;
-(void)_deselectAllNonMultiSelectRowsAnimated:(BOOL)animated;
-(void)_deselectAllNonMultiSelectRowsAnimated:(BOOL)animated notifyDelegate:(BOOL)delegate;
-(void)_deselectRowAtIndexPath:(id)indexPath animated:(BOOL)animated notifyDelegate:(BOOL)delegate;
-(void)_stopAutoscrollTimer;
-(void)_beginReorderingForCell:(id)cell;
-(void)_tableCellAnimationDidStop:(id)_tableCellAnimation finished:(id)finished;
-(void)adjustIndexPaths:(id)paths forMoveOfIndexPath:(id)indexPath toIndexPath:(id)indexPath3;
-(void)_endReorderingForCell:(id)cell wasCancelled:(BOOL)cancelled animated:(BOOL)animated;
-(void)_cancelCellReorder:(BOOL)reorder;
-(void)_endCellReorderAnimation:(BOOL)animation;
-(void)_finishedAnimatingCellReorder:(id)reorder finished:(id)finished context:(id)context;
-(void)_beginReorderAnimationForCell:(id)cell;
-(void)_endReorderAnimations;
-(void)_autoscroll:(id)autoscroll;
-(id)_targetIndexPathAtPoint:(CGPoint)point;
-(void)_setTopSeparatorCell:(id)cell;
-(id)_cellAfterIndexPath:(id)path;
-(NSRange)_visibleGlobalRows;
-(id)_visibleCellForGlobalRow:(int)globalRow;
-(BOOL)_wasEditing;
-(BOOL)_wasEditingRowAtIndexPath:(id)indexPath;
-(BOOL)_isEditingRowAtIndexPath:(id)indexPath;
-(id)_reorderingCell;
-(int)_globalReorderingRow;
-(id)_reorderingIndexPath;
-(id)_sectionHeaderViewWithFrame:(CGRect)frame forSection:(int)section opaque:(BOOL)opaque reuseViewIfPossible:(BOOL)possible;
-(id)_sectionFooterViewWithFrame:(CGRect)frame forSection:(int)section opaque:(BOOL)opaque reuseViewIfPossible:(BOOL)possible;
-(void)_setupCell:(id)cell forEditing:(BOOL)editing canEdit:(BOOL)edit editingStyle:(int)style shouldIndentWhileEditing:(BOOL)editing5 showsReorderControl:(BOOL)control accessoryType:(int)type animated:(BOOL)animated;
-(void)_setupCell:(id)cell forEditing:(BOOL)editing atIndexPath:(id)indexPath animated:(BOOL)animated;
-(id)_createPreparedCellForGlobalRow:(int)globalRow withIndexPath:(id)indexPath;
-(id)_createPreparedCellForGlobalRow:(int)globalRow;
-(id)_createPreparedCellForRowAtIndexPath:(id)indexPath;
-(id)_visibleHeaderViewForSection:(int)section;
-(id)_visibleFooterViewForSection:(int)section;
-(BOOL)allowsHeaderViewsToFloat;
-(BOOL)allowsFooterViewsToFloat;
-(void)_tableHeaderHeightDidChangeToHeight:(float)_tableHeaderHeight;
-(void)_drawExtraSeparator:(CGRect)separator;
-(BOOL)_isCellReorderable:(id)reorderable;
-(id)titleForDeleteConfirmationButton:(id)deleteConfirmationButton;
-(void)_reorderPositionChangedForCell:(id)cell;
-(void)_endSwipeToDeleteRowDidDelete:(BOOL)_endSwipeToDeleteRow;
-(void)_removeWasCanceledForCell:(id)cell;
-(void)_didInsertRowForTableCell:(id)tableCell;
-(void)_finishedRemovingRemovalButtonForTableCell:(id)tableCell;
-(void)animateDeletionOfRowWithCell:(id)cell;
-(BOOL)_isShowingIndex;
-(CGRect)_indexRect;
-(void)_setCell:(id)cell isAncestorOfFirstResponder:(BOOL)firstResponder;
-(id)_rowData;
-(id)_indexPathForSwipeRowAtPoint:(CGPoint)point;
-(BOOL)_wantsSwipes;
-(BOOL)_isTableHeaderViewHidden;
-(float)_spacingForExtraSeparators;
-(BOOL)_shouldShowMenuForCell:(id)cell __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_3_1);
-(BOOL)_canPerformAction:(SEL)action forCell:(id)cell sender:(id)sender __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_3_1);
-(void)_performAction:(SEL)action forCell:(id)cell sender:(id)sender __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_3_1);
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_3_2
-(BOOL)_delegateImplementsTitleWidthForHeaderInSection;
-(BOOL)_delegateImplementsAlignmentForHeaderInSection;
-(BOOL)_delegateImplementsTitleWidthForFooterInSection;
-(BOOL)_delegateImplementsAlignmentForFooterInSection;
-(float)_heightForSeparator;
-(float)_backgroundInset;
#endif
@end

@interface UITableView (_UITableViewPrivate)
-(void)_performScrollTest:(id)test iterations:(int)iterations delta:(int)delta __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_3_1);
-(void)_performScrollTest:(id)test iterations:(int)iterations delta:(int)delta length:(int)length __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_3_1);
-(void)_scroll __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_3_1);
-(id)_swipeGestureRecognizer;
-(void)setUsesGestureRecognizers:(BOOL)recognizers;
-(float)_animationDuration;
-(void)_ensureRowDataIsLoaded;
-(void)_updateRowData;
-(void)_scheduleAdjustExtraSeparators;
-(void)_adjustCountLabel;
-(void)_adjustReusableTableCells;
-(void)_suspendReloads;
-(void)_resumeReloads;
-(unsigned)_countStringRowCount;
-(void)_setRowCount:(int)count;
-(void)setCountStringInsignificantRowCount:(unsigned)count;
-(void)setCountString:(id)string;
-(void)setTableHeaderBackgroundColor:(id)color;
-(id)tableHeaderBackgroundColor;
-(void)setMultiselectCheckmarkColor:(UIColor*)color;
-(UIColor*)multiselectCheckmarkColor;
-(void)_adjustTableHeaderAndFooterViews;
-(void)_updateContentSize;
-(void)_updateIndexFrame;
-(void)_updateIndexTitles:(id)titles;
-(void)_updateIndex;
-(void)_setupCellAnimations;
-(void)_endCellAnimationsWithContext:(id)context;
-(void)_setNeedsVisibleCellsUpdate:(BOOL)update withFrames:(BOOL)frames;
-(void)_updateVisibleCellsImmediatelyIfNecessary;
-(void)_updateVisibleHeadersAndFootersNow;
-(void)_updateVisibleCellsNow;
-(NSRange)_visibleGlobalRowsInRect:(CGRect)rect;
-(BOOL)_shouldDisplayExtraSeparatorsAtOffset:(float*)offset;
-(void)_adjustExtraSeparators;
-(void)_addContentSubview:(id)subview atBack:(BOOL)back;
-(id)_tableViewCellForContentView:(id)contentView;
-(int)_editingStyleForRowAtIndexPath:(id)indexPath;
-(id)_titleForDeleteConfirmationButtonForRowAtIndexPath:(id)indexPath;
-(BOOL)_shouldIndentWhileEditingForRowAtIndexPath:(id)indexPath;
-(int)_accessoryTypeForCell:(id)cell forRowAtIndexPath:(id)indexPath;
-(BOOL)_canMoveRowAtIndexPath:(id)indexPath;
-(id)_reorderingSupport;
-(void)_reuseTableViewCell:(id)cell;
-(void)_reuseHeaderView:(id)view;
-(void)_reuseFooterView:(id)view;
-(void)_updateWithItems:(id)items withOldRowData:(id)oldRowData oldRowRange:(NSRange)range newRowRange:(NSRange)range4 context:(id)context;
-(void)_updateAnimationDidStop:(id)_updateAnimation finished:(id)finished context:(id)context;
-(BOOL)_canEditRowAtIndexPath:(id)indexPath;
-(void)_accessoryButtonAction:(id)action;
-(void)_sectionIndexChanged:(id)changed;
-(void)flashScrollIndicators;
-(void)_updateShowScrollIndicatorsFlag;
-(BOOL)_hasSwipeToDeleteRow;
-(BOOL)_shouldDisplayTopSeparator;
-(void)_languageChanged;
-(void)_validateCells;
-(void)_validateSectionHeadersAndFooters;
-(void)_sendWillBeginEditingForIndexPath:(id)_send;
-(void)_sendDidEndEditingForIndexPath:(id)_send;
-(id)deleteConfirmationIndexPath;
-(void)setDeleteConfirmationIndexPath:(id)path animated:(BOOL)animated;
-(void)_scrollToTopHidingTableHeader:(BOOL)topHidingTableHeader;
-(void)_scrollToTopHidingTableHeaderIfNecessary:(BOOL)topHidingTableHeaderIfNecessary;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_3_2
-(void)_updateBackgroundViewFrame;
-(void)_updateBackgroundView;
-(id)_newSectionViewWithFrame:(CGRect)frame forSection:(int)section isHeader:(BOOL)header;
-(id)_defaultBackgroundView;
-(CGSize)_fontMetrics:(id)metrics;
-(CGSize)_atomBackgroundTextOffset;
#else
-(id)_newSectionViewWithFrame:(CGRect)frame isHeader:(BOOL)header;
#endif
@end

@interface UITableView (SyntheticEvents)
-(id)_scriptingInfo;
@end

@interface UITableView (UIKitAccessibilityInterfaceBuilderSupport)
-(BOOL)isElementAccessibilityExposedToInterfaceBuilder;
@end
