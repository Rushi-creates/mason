import 'dart:convert';

//Todo : (IMP) All functions of this class must be await , or else wont work  
class {{modelClassName}}_api_repo {


/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  // to access funcs of api service class here
  final _provider = ApiHelper.ApiHelperObj;

  int pageSizeVar = 15;  // used in pagination of fetches


/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await _provider.fetchJsonList(
  //     fetchUrl: ApiLinks.someUrl,
  //     pageSize: pageSizeVar,
  //     pageNum: counter,
  //   );

  //   return {{modelClassName}}.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  fetchProp(int counter) async {
    var rawData = await _provider.fetchJsonList_by_prop(
      fetchUrl: ApiLinks.someUrl,
      pageSize: pageSizeVar,
      pageNum: counter,
      customSearch: );

    return {{modelClassName}}.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(modelObj_id) async {
  //   var rawData = await _provider.fetchSingleJson_by_id(ApiLinks.fetchUrl, modelObj_id);

  //   return {{modelClassName}}.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(modelObj) async {
  //   var rawData = await _provider.addApi(ApiLinks.addApiUrl, modelObj);
  //   return {{modelClassName}}.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  // update(modelObj, modelObj_id) async {
  //   var rawData =
  //       await _provider.updateApi(ApiLinks.updateApiUrl, modelObj, modelObj_id);
  //   return {{modelClassName}}.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
//   delete(modelObjArg_Id) async {
//     var rawData = await _provider.deleteApi(ApiLinks.deleteApiUrl, modelObjArg_Id);
//     return rawData; // as api returns string, not a map
//   }
}



/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */
 
  //Todo : while using sp , make sure to use await , kw , or it wont work
  // CacheHelper.get('UserAcc');
  // await CacheHelper.set('UserAcc');
  // await CacheHelper.remove('UserAcc');



 class {{modelClassName}}_sp_repo {

  set_{{modelClassName.lowerCase()}}(value) async {
   return await CacheHelper.set('{{modelClassName.lowerCase()}}', value);
  }

  //! do not use await in get
  get_{{modelClassName.lowerCase()}}(key)  {
   return CacheHelper.get(key);
  }

  remove_{{modelClassName.lowerCase()}}(key) async {
   return await CacheHelper.remove(key);
  }
}

