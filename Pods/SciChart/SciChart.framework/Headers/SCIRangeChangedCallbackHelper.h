//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIRangeChangedCallbackHelper.h is part of SCICHART®, High Performance Scientific Charts
// For full terms and conditions of the license, see http://www.scichart.com/scichart-eula/
//
// This source code is protected by international copyright law. Unauthorized
// reproduction, reverse-engineering, or distribution of all or any portion of
// this source code is strictly prohibited.
//
// This source code contains confidential and proprietary trade secrets of
// SciChart Ltd., and should at no time be copied, transferred, sold,
// distributed or made available without express written permission.
//******************************************************************************

/** \addtogroup Axis
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCICallbackHelper.h"

@protocol SCIRangeProtocol;

typedef void (^SCIAxisVisibleRangeChanged) (id<SCIRangeProtocol> newRange, id<SCIRangeProtocol> oldRange, BOOL isAnimated, id sender);

@interface SCIRangeChangedCallbackHelper : SCICallbackHelper

-(instancetype)initWithCallback:(SCIAxisVisibleRangeChanged)callback;

@property (nonatomic, copy) SCIAxisVisibleRangeChanged callback;

@end

/** @}*/