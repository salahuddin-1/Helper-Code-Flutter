import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mandimarket/src/database/database_constants.dart';
import 'package:mandimarket/src/dependency_injection/user_credentials.dart';
import 'package:mandimarket/src/models/master_model.dart';
import 'package:rxdart/rxdart.dart';

class MasterPaginationBloc {
  String? _type;
  final _ownersPhoneNumber = userCredentials.ownersPhoneNumber;
  final _masterModelCntrl = BehaviorSubject<List<MasterModel>>();

  DocumentSnapshot? _lastDoc;
  List<MasterModel> _usersList = [];
  List<MasterModel> _cacheList = [];

  void addAnItemToCacheList(MasterModel masterModel) {
    _cacheList.add(masterModel);

    _usersList.insert(0, masterModel);
    _masterModelCntrl.sink.add(_usersList);
  }

  bool _gettingMoreUsers = false;
  bool _moreUsersAvailable = true;

  // This method will get called first in the init state first to get the first batch of documents
  void getUsers({int docLimit = 3}) async {
    if (!_moreUsersAvailable) return;
    if (_gettingMoreUsers) return;
    _gettingMoreUsers = true;
    if (_lastDoc == null) {
      final snap = await Database.mastersRef
          .doc(_ownersPhoneNumber)
          .collection(_type!)
          .orderBy('comparingName')
          .limit(docLimit)
          .get();

      if (snap.docs.length < docLimit) _moreUsersAvailable = false;

      if (snap.docs.isNotEmpty) {
        for (int i = 0; i < snap.docs.length; i++) {
          bool addUser = true;
          final doc = snap.docs[i];
          final masterModel = MasterModel.fromDocument(doc);

          for (int j = 0; j < _cacheList.length; j++) {
            if (_cacheList[j].partyName == masterModel.partyName)
              addUser = false;
          }

          if (!addUser) continue;

          this._usersList.add(masterModel);
        }
        _lastDoc = snap.docs.last;
        _masterModelCntrl.sink.add(this._usersList);
      }
      //

    } else {
      final snap = await Database.mastersRef
          .doc(_ownersPhoneNumber)
          .collection(_type!)
          .orderBy('comparingName')
          .limit(docLimit)
          .startAfterDocument(_lastDoc!)
          .get();

      if (snap.docs.length < docLimit) _moreUsersAvailable = false;

      if (snap.docs.isNotEmpty) {
        for (int i = 0; i < snap.docs.length; i++) {
          bool addUser = true;
          final doc = snap.docs[i];
          final masterModel = MasterModel.fromDocument(doc);

          for (int j = 0; j < _cacheList.length; j++) {
            if (_cacheList[j].partyName == masterModel.partyName)
              addUser = false;
          }

          if (!addUser) continue;

          this._usersList.add(masterModel);
        }
        _lastDoc = snap.docs.last;
        _masterModelCntrl.sink.add(this._usersList);
      }
    }
    _gettingMoreUsers = false;
  }

  void editAUser(MasterModel masterModel) {
    var newList = _masterModelCntrl.value;

    for (int i = 0; i < newList.length; i++) {
      if (masterModel.documentId == newList[i].documentId) {
        newList.insert(i, masterModel);
        newList.removeAt(i + 1);
        break;
      }
    }
    _masterModelCntrl.sink.add(newList);
  }

  void deleteAUserFromList(String docId) {
    var newList = _masterModelCntrl.value;

    for (int i = 0; i < newList.length; i++) {
      if (newList[i].documentId == docId) {
        newList.removeAt(i);
        break;
      }
    }
    _masterModelCntrl.sink.add(newList);
    getUsers(docLimit: 1);
  }

  Stream<List<MasterModel>> get streamMasterModel => _masterModelCntrl.stream;

  void dispose() {
    _masterModelCntrl.close();
  }

  MasterPaginationBloc({required String type}) {
    this._type = type.toLowerCase();
  }
}
