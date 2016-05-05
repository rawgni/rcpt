// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.1 clang-703.0.29)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import ObjectiveC;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class NSCoder;

SWIFT_CLASS("_TtC6Former8FormCell")
@interface FormCell : UITableViewCell
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)setup;
@end

@class UILabel;

SWIFT_CLASS("_TtC6Former13FormCheckCell")
@interface FormCheckCell : FormCell
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
- (UILabel * _Nullable)formTitleLabel;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIDatePicker;

SWIFT_CLASS("_TtC6Former18FormDatePickerCell")
@interface FormDatePickerCell : FormCell
@property (nonatomic, readonly, weak) UIDatePicker * _Null_unspecified datePicker;
- (UIDatePicker * _Nonnull)formDatePicker;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6Former20FormHeaderFooterView")
@interface FormHeaderFooterView : UITableViewHeaderFooterView
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)setup;
@end


SWIFT_CLASS("_TtC6Former24FormInlineDatePickerCell")
@interface FormInlineDatePickerCell : FormCell
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified displayLabel;
- (UILabel * _Nullable)formTitleLabel;
- (UILabel * _Nullable)formDisplayLabel;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6Former20FormInlinePickerCell")
@interface FormInlinePickerCell : FormCell
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified displayLabel;
- (UILabel * _Nullable)formTitleLabel;
- (UILabel * _Nullable)formDisplayLabel;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6Former13FormLabelCell")
@interface FormLabelCell : FormCell
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified subTextLabel;
- (UILabel * _Nullable)formTextLabel;
- (UILabel * _Nullable)formSubTextLabel;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6Former19FormLabelFooterView")
@interface FormLabelFooterView : FormHeaderFooterView
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
- (UILabel * _Nonnull)formTitleLabel;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6Former19FormLabelHeaderView")
@interface FormLabelHeaderView : FormHeaderFooterView
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
- (UILabel * _Nonnull)formTitleLabel;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIPickerView;

SWIFT_CLASS("_TtC6Former14FormPickerCell")
@interface FormPickerCell : FormCell
@property (nonatomic, readonly, weak) UIPickerView * _Null_unspecified pickerView;
- (UIPickerView * _Nonnull)formPickerView;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UISegmentedControl;

SWIFT_CLASS("_TtC6Former17FormSegmentedCell")
@interface FormSegmentedCell : FormCell
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
@property (nonatomic, readonly, weak) UISegmentedControl * _Null_unspecified segmentedControl;
- (UILabel * _Nullable)formTitleLabel;
- (UISegmentedControl * _Nonnull)formSegmented;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIView;

SWIFT_CLASS("_TtC6Former26FormSelectorDatePickerCell")
@interface FormSelectorDatePickerCell : FormCell
@property (nonatomic, strong) UIDatePicker * _Nullable selectorDatePicker;
@property (nonatomic, strong) UIView * _Nullable selectorAccessoryView;
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified displayLabel;
- (UILabel * _Nullable)formTitleLabel;
- (UILabel * _Nullable)formDisplayLabel;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6Former22FormSelectorPickerCell")
@interface FormSelectorPickerCell : FormCell
@property (nonatomic, strong) UIPickerView * _Nullable selectorPickerView;
@property (nonatomic, strong) UIView * _Nullable selectorAccessoryView;
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified displayLabel;
- (UILabel * _Nullable)formTitleLabel;
- (UILabel * _Nullable)formDisplayLabel;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UISlider;

SWIFT_CLASS("_TtC6Former14FormSliderCell")
@interface FormSliderCell : FormCell
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified displayLabel;
@property (nonatomic, readonly, weak) UISlider * _Null_unspecified slider;
- (UILabel * _Nullable)formTitleLabel;
- (UILabel * _Nullable)formDisplayLabel;
- (UISlider * _Nonnull)formSlider;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIStepper;

SWIFT_CLASS("_TtC6Former15FormStepperCell")
@interface FormStepperCell : FormCell
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified displayLabel;
@property (nonatomic, readonly, weak) UIStepper * _Null_unspecified stepper;
- (UILabel * _Nullable)formTitleLabel;
- (UILabel * _Nullable)formDisplayLabel;
- (UIStepper * _Nonnull)formStepper;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UISwitch;

SWIFT_CLASS("_TtC6Former14FormSwitchCell")
@interface FormSwitchCell : FormCell
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
@property (nonatomic, readonly, weak) UISwitch * _Null_unspecified switchButton;
- (UILabel * _Nullable)formTitleLabel;
- (UISwitch * _Nonnull)formSwitch;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITextField;

SWIFT_CLASS("_TtC6Former17FormTextFieldCell")
@interface FormTextFieldCell : FormCell
@property (nonatomic, readonly, weak) UITextField * _Null_unspecified textField;
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
- (UITextField * _Nonnull)formTextField;
- (UILabel * _Nullable)formTitleLabel;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITextView;

SWIFT_CLASS("_TtC6Former16FormTextViewCell")
@interface FormTextViewCell : FormCell
@property (nonatomic, readonly, weak) UITextView * _Null_unspecified textView;
@property (nonatomic, readonly, weak) UILabel * _Null_unspecified titleLabel;
- (UITextView * _Nonnull)formTextView;
- (UILabel * _Nullable)formTitleLabel;
- (void)setup;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;
@class Former;
@class NSBundle;

SWIFT_CLASS("_TtC6Former18FormViewController")
@interface FormViewController : UIViewController
@property (nonatomic, readonly, strong) UITableView * _Nonnull tableView;
@property (nonatomic, strong) Former * _Nonnull former;
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSIndexPath;
@class UIScrollView;
@class NSIndexSet;

SWIFT_CLASS("_TtC6Former6Former")
@interface Former : NSObject

/// Number of all sections.
@property (nonatomic, readonly) NSInteger numberOfSections;

/// Number of all rows.
@property (nonatomic, readonly) NSInteger numberOfRows;
- (nonnull instancetype)initWithTableView:(UITableView * _Nonnull)tableView OBJC_DESIGNATED_INITIALIZER;

/// Call when cell has selected.
- (nonnull instancetype)onCellSelected:(void (^ _Nonnull)(NSIndexPath * _Nonnull))handler;

/// Call when tableView has scrolled.
- (nonnull instancetype)onScroll:(void (^ _Nonnull)(UIScrollView * _Nonnull))handler;

/// Call when tableView had begin dragging.
- (nonnull instancetype)onBeginDragging:(void (^ _Nonnull)(UIScrollView * _Nonnull))handler;

/// Call just before cell is deselect.
- (nonnull instancetype)willDeselectCell:(NSIndexPath * _Nullable (^ _Nonnull)(NSIndexPath * _Nonnull))handler;

/// Call just before cell is display.
- (nonnull instancetype)willDisplayCell:(void (^ _Nonnull)(NSIndexPath * _Nonnull))handler;

/// Call just before header is display.
- (nonnull instancetype)willDisplayHeader:(void (^ _Nonnull)(NSInteger))handler;

/// Call just before cell is display.
- (nonnull instancetype)willDisplayFooter:(void (^ _Nonnull)(NSInteger))handler;

/// Call when cell has deselect.
- (nonnull instancetype)didDeselectCell:(void (^ _Nonnull)(NSIndexPath * _Nonnull))handler;

/// Call when cell has Displayed.
- (nonnull instancetype)didEndDisplayingCell:(void (^ _Nonnull)(NSIndexPath * _Nonnull))handler;

/// Call when header has displayed.
- (nonnull instancetype)didEndDisplayingHeader:(void (^ _Nonnull)(NSInteger))handler;

/// Call when footer has displayed.
- (nonnull instancetype)didEndDisplayingFooter:(void (^ _Nonnull)(NSInteger))handler;

/// Call when cell has highlighted.
- (nonnull instancetype)didHighlightCell:(void (^ _Nonnull)(NSIndexPath * _Nonnull))handler;

/// Call when cell has unhighlighted.
- (nonnull instancetype)didUnHighlightCell:(void (^ _Nonnull)(NSIndexPath * _Nonnull))handler;

/// 'true' iff can edit previous row.
- (BOOL)canBecomeEditingPrevious;

/// 'true' iff can edit next row.
- (BOOL)canBecomeEditingNext;

/// Edit previous row iff it can.
- (nonnull instancetype)becomeEditingPrevious;

/// Edit next row iff it can.
- (nonnull instancetype)becomeEditingNext;

/// To end editing of tableView.
- (nonnull instancetype)endEditing;

/// To select row from indexPath.
- (nonnull instancetype)selectWithIndexPath:(NSIndexPath * _Nonnull)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;

/// To deselect current selecting cell.
- (nonnull instancetype)deselect:(BOOL)animated;

/// Reload All cells.
- (nonnull instancetype)reload;

/// Reload sections from section indexSet.
- (nonnull instancetype)reloadWithSections:(NSIndexSet * _Nonnull)sections rowAnimation:(UITableViewRowAnimation)rowAnimation;

/// Reload rows from indesPaths.
- (nonnull instancetype)reloadWithIndexPaths:(NSArray<NSIndexPath *> * _Nonnull)indexPaths rowAnimation:(UITableViewRowAnimation)rowAnimation;

/// Remove All SectionFormers with NO updates.
- (nonnull instancetype)removeAll;

/// Remove All SectionFormers with animated updates.
- (nonnull instancetype)removeAllUpdate:(UITableViewRowAnimation)rowAnimation;

/// Remove SectionFormers from section index with NO updates.
- (nonnull instancetype)removeWithSection:(NSInteger)section;
@end


@interface Former (SWIFT_EXTENSION(Former)) <UITableViewDelegate, UIScrollViewDelegate, UITableViewDataSource>
- (void)scrollViewWillBeginDragging:(UIScrollView * _Nonnull)scrollView;
- (void)scrollViewDidScroll:(UIScrollView * _Nonnull)scrollView;
- (NSIndexPath * _Nullable)tableView:(UITableView * _Nonnull)tableView willDeselectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView willDisplayCell:(UITableViewCell * _Nonnull)cell forRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView willDisplayHeaderView:(UIView * _Nonnull)view forSection:(NSInteger)section;
- (void)tableView:(UITableView * _Nonnull)tableView willDisplayFooterView:(UIView * _Nonnull)view forSection:(NSInteger)section;
- (void)tableView:(UITableView * _Nonnull)tableView didDeselectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didEndDisplayingCell:(UITableViewCell * _Nonnull)cell forRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didEndDisplayingHeaderView:(UIView * _Nonnull)view forSection:(NSInteger)section;
- (void)tableView:(UITableView * _Nonnull)tableView didEndDisplayingFooterView:(UIView * _Nonnull)view forSection:(NSInteger)section;
- (void)tableView:(UITableView * _Nonnull)tableView didHighlightRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didUnhighlightRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSIndexPath * _Nullable)tableView:(UITableView * _Nonnull)tableView willSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (BOOL)tableView:(UITableView * _Nonnull)tableView canEditRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (BOOL)tableView:(UITableView * _Nonnull)tableView canMoveRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForHeaderInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForFooterInSection:(NSInteger)section;
- (UIView * _Nullable)tableView:(UITableView * _Nonnull)tableView viewForHeaderInSection:(NSInteger)section;
- (UIView * _Nullable)tableView:(UITableView * _Nonnull)tableView viewForFooterInSection:(NSInteger)section;
@end


@interface UITableViewCell (SWIFT_EXTENSION(Former))
@property (nonatomic, readonly, strong) UIView * _Nullable inputView;
@property (nonatomic, readonly, strong) UIView * _Nullable inputAccessoryView;
- (BOOL)canBecomeFirstResponder;
@end

#pragma clang diagnostic pop