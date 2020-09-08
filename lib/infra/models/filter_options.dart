//   import 'package:iugu/utils/enums.dart';

// abstract class IQueryStringFilter
//     {
//         String toQueryStringUrl();
//     }

//     class QueryStringFilter extends IQueryStringFilter
//     {
//         String _currentFilter = "";

//         // private readonly Dictionary<ResultOrderType, String> SortResult = new Dictionary<ResultOrderType, String>
//         // {
//         //     [ResultOrderType.Ascending] = "asc",
//         //     [ResultOrderType.Descending] = "desc",
//         // };

//         // private readonly Dictionary<FieldSort, String> FieldsWithSort = new Dictionary<FieldSort, String>
//         // {
//         //     [FieldSort.Id] = "id",
//         //     [FieldSort.Status] = "status",
//         //     [FieldSort.CreateAt] = "created_at",
//         //     [FieldSort.UpdateAt] = "updated_at",
//         //     [FieldSort.Amount] = "amount",
//         //     [FieldSort.AccountName] = "account_name",
//         //     [FieldSort.Name] = "name",
//         // };

//         // private readonly Dictionary<String, String> FilterParams = new Dictionary<String, String>
//         // {
//         //     [nameof(MaxResults)] = "limit={0}",
//         //     [nameof(Start)] = "start={0}",
//         //     [nameof(Since)] = "updated_since={0}",
//         //     [nameof(SortBy)] = "sortBy[{0}]={1}"
//         // };

//          int _maxResults;
//        // [JsonProperty("limit")]
//          int maxResults
//         {
//             get { return _maxResults; }
//             set
//             {
//                 _maxResults = value;
//                 if (value.HasValue)
//                 {
//                     AppendFilter(nameof(MaxResults), value.Value);
//                 }
//             }
//         }

//         int _start;
//         [JsonProperty("start")]
//          int start
//         {
//             get { return _start; }
//             set
//             {
//                 _start = value;

//                 if (value.HasValue)
//                 {
//                     AppendFilter(nameof(start), value.Value);
//                 }
//             }
//         }

//         DateTime _since;
//         [JsonProperty("updated_since")]
//          DateTime? Since
//         {
//             get { return _since; }
//             set
//             {
//                 _since = value;

//                 if (value.HasValue)
//                 {
//                     AppendFilter(nameof(Since), value.Value.ToString("o"));
//                 }
//             }
//         }

//         OrderingFilter _sortBy;

//          OrderingFilter sortBy
//         {
//             get { return _sortBy; }
//             set
//             {
//                 _sortBy = value;
//                 AppendFilter(nameof(SortBy), FieldsWithSort[value.FieldSort], SortResult[value.Order]);
//             }
//         }

//         String _query;

//          String query
//         {
//             get { return _query; }
//             set
//             {
//                 _query = value;

//                 if (!String.IsNullOrEmpty(value))
//                 {
//                     AppendFilter(nameof(Query), value);
//                 }
//             }
//         }

//          String toQueryStringUrl()
//         {
//             if (_currentFilter != null && _currentFilter.trim() != "")
//                 return "$_currentFilter";

//             return "";
//         }

//         void _appendFilter(String propertyName, List<dynamic> args)
//         {
//             if (args != null && (args?.length ?? 0) > 0)
//             {
//                 var queryString = String.Format(FilterParams[propertyName], args);

//                 if (!String.IsNullOrEmpty(_currentFilter))
//                     _currentFilter = String.Join("&", new String[] { _currentFilter, queryString });
//                 else
//                     _currentFilter = queryString;
//             }
//         }
//     }

//      class OrderingFilter
//     {
//          final FieldSort fieldSort;
//          final ResultOrderType order;

//          OrderingFilter(this.fieldSort, this.order);
//     }
