import 'package:flutter/services.dart';
import 'package:health/solidity/constants.dart';
import 'package:web3dart/web3dart.dart';


Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString('assets/abi.json');
  String contractAddress = contractAddressOfDeployed;
  final contract = DeployedContract(ContractAbi.fromJson(abi, 'FileStorage'), EthereumAddress.fromHex(contractAddress));
  return contract;
}

Future<String> callFunction(String funcname, List<dynamic> args, Web3Client ethClient) async {
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKeyUser);
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(funcname);
  final result = await ethClient.sendTransaction(credentials, Transaction.callContract(contract: contract, function: ethFunction, parameters: args), chainId: null, fetchChainIdFromNetworkId: true );
  return result;
}


Future<List<dynamic>>ask(String funcName, List<dynamic> args, Web3Client ethClient) async {
  final contract = await loadContract();
  final ethFunction = contract.function(funcName);
  final result = ethClient.call(contract: contract, function: ethFunction, params: args,sender: EthereumAddress.fromHex(publicKeyUser));
  return result;
}


Future<String> addBio(
    String name,
    int age,
    String sex,
    String phoneNumber,
    Web3Client ethClient,
    ) async {
  String funcName = 'addBio';
  List<dynamic> args = [name, age, sex, phoneNumber];

  // Send transaction to the blockchain
  String result = await callFunction(funcName, args, ethClient);

  return result;
}


Future<UserBio> getUserBio(Web3Client ethClient) async {
  String funcName = 'getUserBio';
  List<dynamic> args = [];

  // Call the getUserBio function on the blockchain
  List<dynamic> result = await ask(funcName, args, ethClient);

  // Parse the result
  String name = result[0] as String;
  int age = result[1] as int;
  String sex = result[2] as String;
  String phoneNumber = result[3] as String;

  return UserBio(name: name, age: age, sex: sex, phoneNumber: phoneNumber);
}

class UserBio {
  final String name;
  final int age;
  final String sex;
  final String phoneNumber;

  UserBio({
    required this.name,
    required this.age,
    required this.sex,
    required this.phoneNumber,
  });
}


Future<String> addUserFilesByUser(
    String fileName,
    String fileHash,
    String description,
    Web3Client ethClient,
    ) async {
  String funcName = 'addUserFilesByUser';
  List<dynamic> args = [fileName, fileHash, description];

  // Send transaction to the blockchain
  String result = await callFunction(funcName, args, ethClient);

  return result;
}


Future<String> addHospitalInstitution(
    EthereumAddress institutionAddress,
    String category,
    String disease,
    Web3Client ethClient,
    ) async {
  String funcName = 'addHospitalInstitution';
  List<dynamic> args = [institutionAddress, category, disease];

  // Send transaction to the blockchain
  String result = await callFunction(funcName, args, ethClient);

  return result;
}