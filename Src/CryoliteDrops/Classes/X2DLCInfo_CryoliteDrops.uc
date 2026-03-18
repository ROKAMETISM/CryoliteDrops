//---------------------------------------------------------------------------------------
//  FILE:    X2DLCInfo_CryoliteDrops.uc
//  AUTHOR:  Iridar / Enhanced Mod Project Template --  26/02/2024
//  PURPOSE: Contains various DLC hooks, with examples on using the most popular ones.
//           Delete this file if you do not end up using it, as every class
//           that extends X2DownloadableContentInfo adds a tiny performance cost.
//---------------------------------------------------------------------------------------

class X2DLCInfo_CryoliteDrops extends X2DownloadableContentInfo config(Cryolite);

var config int Follower_Chance;
var config int Follower_MinCount;
var config int Follower_MaxCount;


var config int Leader_Chance;
var config int Leader_MinCount;
var config int Leader_MaxCount;

var config array<name> FollowerNames;
var config array<name> LeaderNames;


 static event OnPostTemplatesCreated()
 {
	local LootTableEntry FEntry, LEntry;
	

    FEntry.Chance = Follower_Chance;;
    FEntry.MinCount = Follower_MinCount;
    FEntry.MaxCount = Follower_MaxCount;
    FEntry.TemplateName = 'FrostFollowerCryolite';
    FEntry.RollGroup = 0;



 }
