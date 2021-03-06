//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIBandSeriesStyle.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Themes
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCICallbackBlock.h"
#import "SCIStyleProtocol.h"

@class SCIPenStyle;
@class SCIBrushStyle;
@protocol SCIPointMarkerProtocol;

/**
 * @brief The SCIBandSeriesStyle class.
 * @discussion Provides styling capabilities for SCIBandRenderableSeries within SciChart.
 * @see SCIStyleProtocol
 * @see SCIBandRenderableSeries
 */
@interface SCIBandSeriesStyle : NSObject <SCIStyleProtocol, NSCopying>

/**
 * @brief Defines first line's thickness and color
 * @code
 * style.pen1 = SCIPenSolid(colorCode: 0xFF00FF00, width: 1)
 * @encode
 * @see SCIPenStyle
 */
@property (nonatomic, strong) SCIPenStyle * strokeStyle;

/**
 * @brief Defines second line's thickness and color
 * @code
 * style.pen2 = SCIPenSolid(colorCode: 0xFF0000FF, width: 1)
 * @encode
 * @see SCIPenStyle
 */
@property (nonatomic, strong) SCIPenStyle * strokeY1Style;

/**
 * @brief Defines area fill color if first line is on top
 * @code
 * style.brush1 = SCIBrushSolid(colorCode: 0x7000FF00)
 * @encode
 * @see SCIBrushStyle
 */
@property (nonatomic, strong) SCIBrushStyle * fillBrushStyle;

/**
 * @brief Defines area fill color if second line is on top
 * @code
 * style.brush2 = SCIBrushSolid(colorCode: 0x700000FF)
 * @encode
 * @see SCIBrushStyle
 */
@property (nonatomic, strong) SCIBrushStyle * fillY1BrushStyle;

/**
 * @brief If true acts like a digital line, outline will be jagged
 */
@property (nonatomic) BOOL isDigitalLine;

/**
 * @brief Defines point marker for first line
 * @discussion Point markers will be displayed at data points if drawPointMarkers is set to true
 * @code
 * let marker = SCIEllipsePointMarker()
 * marker.drawBorder = false
 * marker.fillBrush = SCIBrushSolid(color: UIColor.redColor())
 * bandSeries.style.pointMarker1 = marker
 * @endcode
 * @see SCIPointMarkerProtocol
 */
@property (nonatomic, strong) id<SCIPointMarkerProtocol> pointMarker;

/**
 * @brief Defines point marker for second line
 * @discussion Point markers will be displayed at data points if drawPointMarkers is set to true
 * @code
 * let marker = SCIEllipsePointMarker()
 * marker.drawBorder = false
 * marker.fillBrush = SCIBrushSolid(color: UIColor.redColor())
 * bandSeries.style.pointMarker2 = marker
 * @endcode
 * @see SCIPointMarkerProtocol
 */
@property (nonatomic, strong) id<SCIPointMarkerProtocol> pointMarker1;

@end

/** @} */
