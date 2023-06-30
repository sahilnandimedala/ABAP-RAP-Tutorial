@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'GS - Flight Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Analytics.query: true

define view entity ZGS_ALP_C_FLIGHT_BOOKINGS
  as select from ZGS_ALP_FLIGHT_BOOKINGS
{
  /** DIMENSIONS **/

  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  AirlineID,
  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  FlightConnection,
  @AnalyticsDetails.query.display: #KEY
  @AnalyticsDetails.query.axis: #FREE
  FlightDate,
  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  Customer,
  //  @AnalyticsDetails.query.display: #KEY_TEXT
  //  @AnalyticsDetails.query.axis: #FREE
  //  TravelAgency,
  @AnalyticsDetails.query.display: #KEY
  @AnalyticsDetails.query.axis: #FREE
  CalendarYear,
  @AnalyticsDetails.query.display: #TEXT
  @AnalyticsDetails.query.axis: #FREE
  CalendarMonth,
  @AnalyticsDetails.query.display: #TEXT
  @AnalyticsDetails.query.axis: #FREE
  CustomerCountry,
  @AnalyticsDetails.query.display: #KEY
  @AnalyticsDetails.query.axis: #FREE
  CustomerCity,
  //    @AnalyticsDetails.query.display: #TEXT
  //    @AnalyticsDetails.query.axis: #FREE
  //    TravelAgencyCountry,
  //    @AnalyticsDetails.query.display: #KEY
  //    @AnalyticsDetails.query.axis: #FREE
  //    TravelAgencyCity,
  @AnalyticsDetails.query.display: #KEY
  @AnalyticsDetails.query.axis: #FREE
  Currency,
  //    @AnalyticsDetails.query.display: #KEY
  //    @AnalyticsDetails.query.axis: #FREE
  //    WeightUOM,

  /** MEASURES **/

  TotalOfBookings,
  //    WeightOfLuggage,
  @Semantics.amount.currencyCode: 'Currency'
  BookingPrice

  //    @EndUserText.label: 'Average Weight Per Flight'
  //    @AnalyticsDetails.exceptionAggregationSteps.exceptionAggregationBehavior: #AVG
  //    @AnalyticsDetails.exceptionAggregationSteps.exceptionAggregationElements: [ 'Airline', 'FlightConnection', 'FlightDate' ]
  //    @AnalyticsDetails.query.formula: '$projection.WeightOfLuggage'
  //    @AnalyticsDetails.query.decimals: 0
  //    0 as AverageWeightPerFlight
}
