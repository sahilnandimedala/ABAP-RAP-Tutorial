@AccessControl.authorizationCheck: #NOT_ALLOWED
@Analytics.dataCategory: #CUBE
@EndUserText.label: 'Flight Bookings ALP'
define view entity ZGS_ALP_FLIGHT_BOOKINGS
  as select from /DMO/I_Booking_M

  association [0..1] to I_CalendarDate    as _CalendarDate on  $projection.FlightDate = _CalendarDate.CalendarDate
  association [0..1] to /DMO/I_Flight     as _Airline      on  $projection.AirlineID = _Airline.AirlineID
  association [0..1] to /DMO/I_Connection as _Connection   on  $projection.AirlineID    = _Connection.AirlineID
                                                           and $projection.FlightConnection = _Connection. ConnectionID
  association [0..1] to /DMO/I_Customer   as _Customer     on  $projection.Customer = _Customer.CustomerID
  //  association [0..1] to /DMO/I_Agency     as _TravelAgency on  $projection.travel_id = _TravelAgency.

{
@EndUserText.label: 'Airline'
  @ObjectModel.foreignKey.association: '_Airline'
  carrier_id                 as AirlineID,

  @EndUserText.label: 'Connection'
  @ObjectModel.foreignKey.association: '_Connection'
  connection_id                 as FlightConnection,

  @EndUserText.label: 'Flight Date'
  @ObjectModel.foreignKey.association: '_CalendarDate'
  flight_date                 as FlightDate,

  @EndUserText.label: 'Book No.'
  booking_id                 as BookNumber,

  @EndUserText.label: 'Customer'
  @ObjectModel.foreignKey.association: '_Customer'
  customer_id               as Customer,

//  @EndUserText.label: 'Travel Agency'
//  @ObjectModel.foreignKey.association: '_TravelAgency'
//                as TravelAgency,

  @EndUserText.label: 'Flight Year'
  _CalendarDate.CalendarYear,

  @EndUserText.label: 'Flight Month'
  _CalendarDate.CalendarMonth,

  @EndUserText.label: 'Customer Country'
  @ObjectModel.foreignKey.association: '_CustomerCountry'
  _Customer.CountryCode      as CustomerCountry,

  @EndUserText.label: 'Customer City'
  _Customer.City         as CustomerCity,

//  @EndUserText.label: 'Travel Agency Country'
//  @ObjectModel.foreignKey.association: '_TravelAgencyCountry'
//  _TravelAgency.Country  as TravelAgencyCountry,
//
//  @EndUserText.label: 'Travel Agency Customer City'
//  _TravelAgency.City     as TravelAgencyCity,

  /** MEASURES **/

  @EndUserText.label: 'Total of Bookings'
  @DefaultAggregation: #SUM
  1                      as TotalOfBookings,

//  @EndUserText.label: 'Weight of Luggage'
//  @DefaultAggregation: #SUM
//  @Semantics.quantity.unitOfMeasure: 'WeightUOM'
//  luggweight             as WeightOfLuggage,
//
//  @EndUserText.label: 'Weight Unit'
//  @Semantics.unitOfMeasure: true
//  wunit                  as WeightUOM,

  @EndUserText.label: 'Booking Price'
  @DefaultAggregation: #SUM
  @Semantics.amount.currencyCode: 'Currency'
  flight_price               as BookingPrice,

  @EndUserText.label: 'Currency'
  currency_code              as Currency,

  // Associations
  _Airline,
  _CalendarDate,
  _CalendarDate._CalendarMonth,
  _CalendarDate._CalendarYear,
  _Connection,
  _Customer,
  _Customer._Country     as _CustomerCountry
//  _TravelAgency,
//  _TravelAgency._Country as _TravelAgencyCountry
}
