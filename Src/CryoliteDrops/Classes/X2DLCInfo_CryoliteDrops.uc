//---------------------------------------------------------------------------------------
//  FILE:    X2DLCInfo_CryoliteDrops.uc
//  AUTHOR:  Iridar / Enhanced Mod Project Template --  26/02/2024
//  PURPOSE: Contains various DLC hooks, with examples on using the most popular ones.
//           Delete this file if you do not end up using it, as every class
//           that extends X2DownloadableContentInfo adds a tiny performance cost.
//---------------------------------------------------------------------------------------

class X2DLCInfo_CryoliteDrops extends X2DownloadableContentInfo config(Cryolite);

var config array<name> FollowerNames;
var config array<name> LeaderNames;


static event OnPostTemplatesCreated()
{
	AddCryolite(class'X2DLCInfo_CryoliteDrops'.default.FollowerNames, 'FrostFollowerCryolite');
	AddCryolite(class'X2DLCInfo_CryoliteDrops'.default.LeaderNames, 'FrostLeaderCryolite');
}


 static private function AddCryolite(const array<name> CharTemplateNames, const name CryoliteLootTableName) {
	local X2CharacterTemplateManager    CharMgr;
	local X2CharacterTemplate           CharTemplate;
	local array<X2DataTemplate>			DifficultyVariants;
	local X2DataTemplate				DifficultyVariant;
	local X2DataTemplate				DataTemplate;
	local name CharTemplateName;
	local LootReference Loot;
 	Loot.ForceLevel = 0;
	Loot.LootTableName = CryoliteLootTableName;
	CharMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();

	foreach CharTemplateNames(CharTemplateName) {
		CharMgr.FindDataTemplateAllDifficulties(CharTemplateName, DifficultyVariants);
		foreach DifficultyVariants(DifficultyVariant) {
			CharTemplate = X2CharacterTemplate(DifficultyVariant);
			if (CharTemplate == none)
				continue;
			CharTemplate.Loot.LootReferences.AddItem(Loot);
		}
	}
}
