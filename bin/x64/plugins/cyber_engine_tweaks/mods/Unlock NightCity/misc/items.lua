local ItemsManager = {}

local WeaponsList = {
	"Items.Preset_Knuckles_Default",
	"Items.Preset_Knuckles_Golden",
	"Items.Preset_Knuckles_Military",
	"Items.Preset_Knuckles_Pimp",
	"Items.GrenadeIncendiaryHoming",
	"Items.GrenadeIncendiarySticky",
	"Items.GrenadeIncendiaryRegular",
	"Items.GrenadeEMPHoming",
	"Items.GrenadeEMPSticky",
	"Items.GrenadeEMPRegular",
	"Items.GrenadeFragRegular",
	"Items.GrenadeFragHoming",
	"Items.GrenadeFragSticky",
	"Items.RecipeGrenadeFragRegular",
	"Items.RecipeGrenadeFragHoming",
	"Items.RecipeGrenadeFragSticky",
	"Items.GrenadeCuttingRegular",
	"Items.GrenadeBiohazardHoming",
	"Items.GrenadeBiohazardRegular",
	"Items.GrenadeReconRegular",
	"Items.GrenadeReconSticky",
	"Items.GrenadeFlashRegular",
	"Items.GrenadeFlashHoming",
	"Items.RecipeGrenadeFlashRegular",
	"Items.RecipeGrenadeFlashHoming",
	"Items.Preset_Shovel_Caretaker",
	"Items.Preset_Hammer_Default",
	"Items.Preset_Hammer_Sasquatch",
	"Items.Preset_HMG_Default",
	"Items.w_special_flak",
	"Items.Preset_Katana_GoG",
	"Items.Preset_Katana_Cocktail",
	"Items.Preset_Katana_Takemura",
	"Items.Preset_Katana_Default",
	"Items.Preset_Katana_Military",
	"Items.Preset_Katana_Neon",
	"Items.Preset_Katana_Training",
	"Items.Preset_Katana_Saburo",
	"Items.Preset_Katana_Surgeon",
	"Items.Preset_Katana_Hiromi",
	"Items.Preset_Knife_Default",
	"Items.Preset_Knife_Military",
	"Items.mq001_scorpions_knife",
	"Items.Preset_Knife_Stinger",
	"Items.Preset_Tanto_Default",
	"Items.Preset_Kukri_Default",
	"Items.Preset_Kukri_Voodoo",
	"Items.Preset_Machete_Default",
	"Items.Preset_Machete_Maelstrom",
	"Items.Preset_Machete_Valentinos",
	"Items.Preset_Lexington_DEBUG",
	"Items.Preset_Cane_Fingers",
	"Items.Preset_Crowbar_Default",
	"Items.Preset_Baton_Alpha",
	"Items.UncommonBatonRecipe",
	"Items.Preset_Baton_Beta",
	"Items.Preset_Baton_Gamma",
	"Items.Preset_Dildo_Stout",
	"Items.Preset_Iron_Pipe_Default",
	"Items.Preset_Baton_Tinker_Bell",
	"Items.sq021_peter_pan_baton",
	"Items.Preset_Tire_Iron_Default",
	"Items.Preset_Tomahawk_Default",
	"Items.Preset_Base_Copperhead",
	"Items.Preset_Copperhead_Default",
	"Items.Preset_Copperhead_Neon",
	"Items.Preset_Copperhead_Pimp",
	"Items.RareCopperheadRecipe",
	"Items.UncommonCopperheadRecipe",
	"Items.Preset_Masamune_Default",
	"Items.Preset_Base_Masamune",
	"Items.Preset_Masamune_Military",
	"Items.Preset_Masamune_Neon",
	"Items.Preset_Masamune_Pimp",
	"Items.Preset_Masamune_Trauma",
	"Items.EpicMasamuneRecipe",
	"Items.Preset_Ajax_Default",
	"Items.Preset_Ajax_Military",
	"Items.Preset_Ajax_Neon",
	"Items.Preset_Ajax_Pimp",
	"Items.Preset_Ajax_Training",
	"Items.RareAjaxRecipe",
	"Items.Preset_Ajax_Moron",
	"Items.Preset_Masamune_Rogue",
	"Items.Preset_Copperhead_Genesis",
	"Items.Preset_Testera_Default",
	"Items.Preset_Testera_Neon",
	"Items.Preset_Testera_Pimp",
	"Items.Preset_Igla_Default",
	"Items.Preset_Igla_Military",
	"Items.Preset_Igla_Neon",
	"Items.Preset_Igla_Pimp",
	"Items.LegendaryIglaRecipe",
	"Items.Preset_Igla_Sovereign",
	"Items.Preset_Defender_Default",
	"Items.Preset_Defender_Military",
	"Items.Preset_Defender_Neon",
	"Items.Preset_Defender_Pimp",
	"Items.Preset_Nue_Maiko",
	"Items.mq011_wilson_gun",
	"Items.Preset_Lexington_Wilson",
	"Items.Preset_Q001_Lexington",
	"Items.Base_Silverhand",
	"Items.Preset_Liberty_Yorinobu",
	"Items.Preset_Nue_Jackie",
	"Items.Preset_Liberty_Default",
	"Items.Preset_Lexington_Default",
	"Items.Preset_Base_Lexington",
	"Items.Preset_Lexington_Military",
	"Items.Preset_Lexington_Neon",
	"Items.Preset_Lexington_Pimp",
	"Items.Preset_Lexington_Toygun",
	"Items.RareLexingtonRecipe",
	"Items.Preset_Silverhand_3516",
	"Items.Preset_Nue_Default",
	"Items.Preset_Nue_Military",
	"Items.Preset_Nue_Neon",
	"Items.Preset_Nue_Pimp",
	"Items.UncommonNueRecipe",
	"Items.Preset_Liberty_Dex",
	"Items.Preset_Liberty_Rogue",
	"Items.Preset_Nue_Arasaka_2020",
	"Items.Preset_Unity_Default",
	"Items.Preset_Unity_Military",
	"Items.Preset_Unity_Neon",
	"Items.Preset_Unity_Pimp",
	"Items.Preset_V_Unity",
	"Items.RareUnityRecipe",
	"Items.Preset_Sor22_Default",
	"Items.Preset_Sor22_Pimp",
	"Items.Preset_Sor22_Military",
	"Items.Preset_Sor22_Neon",
	"Items.EpicSor22Recipe",
	"Items.RareSor22Recipe",
	"Items.Preset_Overture_Cassidy",
	"Items.q114_cassidy_revolver",
	"Items.Preset_Overture_Kerry",
	"Items.Preset_Overture_River",
	"Items.sq029_rivers_gun",
	"Items.Preset_Nova_Doom_Doom",
	"Items.Preset_MQ008_Nova",
	"Items.Preset_Nova_Default",
	"Items.Preset_Nova_Q000_Nomad",
	"Items.Preset_Nova_Military",
	"Items.Preset_Nova_Neon",
	"Items.Preset_Nova_Pimp",
	"Items.LegendaryNovaRecipe",
	"Items.RareNovaRecipe",
	"Items.Preset_Overture_Default_E",
	"Items.Preset_Overture_Default_L",
	"Items.Preset_Overture_Legendary",
	"Items.Preset_Overture_Default",
	"Items.Preset_Overture_Default_R",
	"Items.Preset_Overture_Default_U",
	"Items.Preset_Overture_Military",
	"Items.Preset_Overture_Neon",
	"Items.Preset_Overture_Pimp",
	"Items.EpicOvertureRecipe",
	"Items.Preset_Carnage_Default",
	"Items.Preset_Carnage_Military",
	"Items.Preset_Carnage_Neon",
	"Items.Preset_Carnage_Pimp",
	"Items.EpicCarnageRecipe",
	"Items.Preset_Crusher_Default",
	"Items.Preset_Crusher_Military",
	"Items.Preset_Crusher_Neon",
	"Items.Preset_Crusher_Pimp",
	"Items.RareCrusherRecipe",
	"Items.Preset_Tactician_Default",
	"Items.Preset_Tactician_Military",
	"Items.Preset_Tactician_Neon",
	"Items.Preset_Tactician_Pimp",
	"Items.EpicTacticianRecipe",
	"Items.LegendaryTacticianRecipe",
	"Items.RareTacticianRecipe",
	"Items.Preset_Carnage_Mox",
	"Items.Preset_Tactician_Headsman",
	"Items.mq025_buck_gun",
	"Items.Preset_Grad_Buck",
	"Items.Preset_Grad_Panam",
	"Items.Preset_Grad_Default",
	"Items.Preset_Grad_Military",
	"Items.Preset_Grad_Neon",
	"Items.Preset_Grad_Pimp",
	"Items.EpicGradRecipe",
	"Items.RareGradRecipe",
	"Items.Preset_Pulsar_Buzzsaw",
	"Items.Preset_Pulsar_Default",
	"Items.Preset_Pulsar_Military",
	"Items.Preset_Pulsar_Neon",
	"Items.Preset_Pulsar_Pimp",
	"Items.EpicPulsarRecipe",
	"Items.RarePulsarRecipe",
	"Items.Preset_Saratoga_Maelstrom",
	"Items.Preset_Saratoga_Default",
	"Items.Preset_Saratoga_Military",
	"Items.Preset_Saratoga_Neon",
	"Items.Preset_Saratoga_Pimp",
	"Items.RareSaratogaRecipe",
	"Items.Preset_Saratoga_Raffen",
	"Items.Preset_Sidewinder_Default",
	"Items.Preset_Sidewinder_Neon",
	"Items.Preset_Sidewinder_Pimp",
	"Items.EpicSidewinderRecipe",
	"Items.Preset_Sidewinder_Divided",
	"Items.Preset_Palica_Default",
	"Items.Preset_Palica_Military",
	"Items.Preset_Palica_Neon",
	"Items.Preset_Palica_Pimp",
	"Items.EpicPalicaRecipe",
	"Items.Preset_Chao_Default",
	"Items.Preset_Chao_Military",
	"Items.Preset_Chao_Neon",
	"Items.Preset_Chao_Pimp",
	"Items.EpicChaoRecipe",
	"Items.Preset_Yukimura_Kiji",
	"Items.Preset_Yukimura_Default",
	"Items.Preset_Yukimura_Military",
	"Items.Preset_Yukimura_Neon",
	"Items.Preset_Yukimura_Pimp",
	"Items.EpicYukimuraRecipe",
	"Items.LegendaryYukimuraRecipe",
	"Items.Preset_Yukimura_Skippy",
	"Items.Preset_Zhuo_Eight_Star",
	"Items.Preset_Zhuo_Default",
	"Items.Preset_Zhuo_Military",
	"Items.Preset_Zhuo_Neon",
	"Items.Preset_Zhuo_Pimp",
	"Items.Preset_Zhuo_Trauma",
	"Items.LegendaryZhuoRecipe",
	"Items.Preset_Ashura_Default",
	"Items.Preset_Ashura_Military",
	"Items.Preset_Ashura_Neon",
	"Items.Preset_Ashura_Pimp",
	"Items.LegendaryAshuraRecipe",
	"Items.Preset_Dian_Default",
	"Items.Preset_Dian_Military",
	"Items.Preset_Dian_Neon",
	"Items.Preset_Dian_Pimp",
	"Items.Preset_Dian_Trauma",
	"Items.LegendaryDianRecipe",
	"Items.Preset_Shingen_Prototype",
	"Items.Preset_Shingen_Default",
	"Items.Preset_Shingen_Military",
	"Items.Preset_Shingen_Neon",
	"Items.Preset_Shingen_Pimp",
	"Items.RareShingenRecipe",
	"Items.Preset_Dian_Yinglong",
	"Items.Preset_Satara_Default",
	"Items.Preset_Satara_Military",
	"Items.Preset_Satara_Neon",
	"Items.Preset_Satara_Pimp",
	"Items.RareSataraRecipe",
	"Items.RareTesteraRecipe",
	"Items.UncommonSataraRecipe",
	"Items.Preset_Kenshin_Frank",
	"Items.Preset_Kenshin_Royce",
	"Items.Preset_Kenshin_Default",
	"Items.Preset_Kenshin_MQ041",
	"Items.Preset_Kenshin_Takemura",
	"Items.Preset_Kenshin_Military",
	"Items.Preset_Kenshin_Neon",
	"Items.Preset_Kenshin_Pimp",
	"Items.EpicKenshinRecipe",
	"Items.Preset_Omaha_Suzie",
	"Items.Preset_Omaha_Default",
	"Items.Preset_Omaha_Military",
	"Items.Preset_Omaha_Neon",
	"Items.Preset_Omaha_Pimp",
	"Items.RareOmahaRecipe",
	"Items.q115_corpo_rifle",
	"Items.Preset_Achilles_Default",
	"Items.Preset_Achilles_Military",
	"Items.Preset_Achilles_Neon",
	"Items.Preset_Achilles_Pimp",
	"Items.Preset_Achilles_Tiny_Mike",
	"Items.LegendaryAchillesRecipe",
	"Items.Preset_Achilles_Nash",
	"Items.Preset_Burya_Comrade",
	"Items.Preset_Quasar_Default",
	"Items.Preset_Quasar_Military",
	"Items.Preset_Quasar_Neon",
	"Items.Preset_Quasar_Pimp",
	"Items.LegendaryQuasarRecipe",
	"Items.RareQuasarRecipe",
	"Items.Preset_Burya_Default",
	"Items.Preset_Burya_Military",
	"Items.Preset_Burya_Neon",
	"Items.Preset_Burya_Pimp",
	"Items.RareBuryaRecipe",
	"Items.Preset_Nekomata_Default",
	"Items.Preset_Nekomata_Military",
	"Items.Preset_Nekomata_Neon",
	"Items.Preset_Nekomata_Pimp",
	"Items.LegendaryNekomataRecipe",
	"Items.RareNekomataRecipe",
	"Items.LegendaryBatRecipe",
	"Items.Preset_Baseball_Bat_Denny",
	"Items.Preset_Kanabo_Default",
	"Items.w_att_scope_short_03",
	"Items.w_att_scope_short_04",
	"Items.w_att_scope_long_02",
	"Items.w_att_scope_sniper_02",
	"Items.w_att_scope_sniper_01",
	"Items.w_att_scope_short_02",
	"Items.w_att_scope_long_01",
	"Items.w_att_scope_long_03",
	"Items.w_att_scope_short_01",
	"Items.w_att_scope_long_04",
	"Items.w_att_scope_short_05",
	"Items.SimpleWeaponMod16",
	"Items.ValentinosMeleeWeaponMod",
	"Items.SimpleWeaponMod04",
	"Items.Recipe_SimpleWeaponMod04",
	"Items.SimpleWeaponMod11",
	"Items.SimpleWeaponMod01",
	"Items.Recipe_SimpleWeaponMod01",
	"Items.Recipe_TechWeaponMod02",
	"Items.Recipe_PowerWeaponMod03",
	"Items.Recipe_PowerWeaponMod01",
	"Items.ArasakaMeleeWeaponMod",
	"Items.Recipe_TechWeaponMod04",
	"Items.TygerRangedWeaponMod",
	"Items.Recipe_PowerWeaponMod04",
	"Items.SimpleWeaponMod03",
	"Items.Recipe_SimpleWeaponMod03",
	"Items.SimpleWeaponMod17",
	"Items.SimpleWeaponMod02",
	"Items.Recipe_SimpleWeaponMod02",
	"Items.WraithsRangedWeaponMod",
	"Items.Recipe_PowerWeaponMod02",
	"Items.SimpleWeaponMod12",
	"Items.WraithsMeleeWeaponMod",
	"Items.Recipe_PowerWeaponMod05",
	"Items.Recipe_PowerWeaponMod06",
	"Items.Recipe_TechWeaponMod01",
	"Items.ValentinosRangedWeaponMod",
	"Items.SimpleWeaponMod13",
	"Items.TygerMeleeWeaponMod"
}

function ItemsManager.Weapons()
    return WeaponsList
end

local ClothesList = {
	"Items.PowerfulFabricEnhancer02",
	"Items.SimpleFabricEnhancer01",
	"Items.SimpleFabricEnhancer05",
	"Items.SimpleFabricEnhancer14",
	"Items.SimpleFabricEnhancer04",
	"Items.PowerfulFabricEnhancer01",
	"Items.PowerfulFabricEnhancer06",
	"Items.PowerfulFabricEnhancer08",
	"Items.SimpleFabricEnhancer06",
	"Items.SimpleFabricEnhancer03",
	"Items.SimpleFabricEnhancer09",
	"Items.PowerfulFabricEnhancer03",
	"Items.SimpleFabricEnhancer10",
	"Items.PowerfulFabricEnhancer07",
	"Items.SimpleFabricEnhancer02",
	"Items.SimpleFabricEnhancer07",
	"Items.PowerfulFabricEnhancer05",
	"Items.PowerfulFabricEnhancer04",
	"Items.SimpleFabricEnhancer12",
	"Items.SimpleFabricEnhancer13",
	"Items.SimpleFabricEnhancer11",
	"Items.Glasses_05_basic_04",
	"Items.Mask_03_rich_02",
	"Items.Tech_02_basic_01",
	"Items.Visor_02_basic_02",
	"Items.Mask_02_rich_01",
	"Items.Glasses_02_basic_04",
	"Items.Visor_02_rich_02",
	"Items.Visor_01_basic_03",
	"Items.Visor_02_basic_01",
	"Items.Mask_02_old_03",
	"Items.Glasses_05_old_01",
	"Items.Glasses_01_basic_05",
	"Items.Glasses_02_basic_05",
	"Items.Tech_01_basic_02",
	"Items.Glasses_03_basic_01",
	"Items.Tech_02_old_01",
	"Items.Visor_02_rich_03",
	"Items.Glasses_03_basic_09",
	"Items.Glasses_02_basic_02",
	"Items.Glasses_01_basic_02",
	"Items.Glasses_03_basic_03",
	"Items.Glasses_01_basic_03",
	"Items.Glasses_03_basic_02",
	"Items.Glasses_05_old_02",
	"Items.Visor_01_basic_02",
	"Items.Glasses_03_basic_08",
	"Items.Mask_03_rich_01",
	"Items.Q005_Johnny_Glasses",
	"Items.Tech_01_rich_01",
	"Items.Tech_02_rich_02",
	"Items.Tech_02_basic_02",
	"Items.Mask_02_basic_02",
	"Items.Glasses_05_basic_03",
	"Items.Mask_03_basic_01",
	"Items.EpicMaskRecipe",
	"Items.Mask_03_basic_02",
	"Items.Mask_03_old_02",
	"Items.Glasses_03_basic_10",
	"Items.Mask_02_rich_02",
	"Items.Tech_01_rich_02",
	"Items.Visor_02_old_02",
	"Items.Tech_01_old_01",
	"Items.Mask_02_old_01",
	"Items.Mask_02_old_02",
	"Items.Glasses_03_basic_05",
	"Items.Glasses_05_basic_02",
	"Items.Glasses_03_basic_04",
	"Items.Visor_02_basic_03",
	"Items.Glasses_03_basic_07",
	"Items.Glasses_01_basic_04",
	"Items.Glasses_01_basic_01",
	"Items.Glasses_03_basic_06",
	"Items.Visor_01_basic_05",
	"Items.Tech_02_rich_01",
	"Items.Glasses_05_basic_01",
	"Items.Glasses_02_basic_03",
	"Items.Visor_01_basic_01",
	"Items.Mask_02_basic_01",
	"Items.Visor_01_basic_04",
	"Items.Glasses_02_basic_01",
	"Items.Tech_01_basic_01",
	"Items.Q203_Epilogue_Glasses",
	"Items.Mask_03_old_01",
	"Items.SQ004_RaffenShiv_Mask",
	"Items.Visor_02_rich_01",
	"Items.FormalShoes_03_rich_01",
	"Items.Boots_11_old_01",
	"Items.CasualShoes_02_old_02",
	"Items.CasualShoes_06_old_01",
	"Items.Boots_05_rich_01",
	"Items.CasualShoes_07_basic_03",
	"Items.CasualShoes_07_rich_02",
	"Items.CasualShoes_01_basic_02",
	"Items.Boots_08_old_02",
	"Items.Boots_05_basic_01",
	"Items.Boots_02_rich_001",
	"Items.Boots_07_basic_02",
	"Items.Boots_08_rich_01",
	"Items.CasualShoes_02_old_01",
	"Items.CasualShoes_06_rich_01",
	"Items.Boots_07_rich_01",
	"Items.FormalShoes_02_basic_02",
	"Items.Boots_04_basic_02",
	"Items.FormalShoes_01_basic_02",
	"Items.Boots_02_basic_01",
	"Items.Boots_09_old_01",
	"Items.FormalShoes_03_rich_02",
	"Items.FormalShoes_02_rich_03",
	"Items.LegendaryFormalShoesRecipe",
	"Items.CasualShoes_04_basic_01",
	"Items.CasualShoes_04_basic_02",
	"Items.FormalShoes_02_basic_03",
	"Items.CasualShoes_05_basic_01",
	"Items.CasualShoes_02_basic_01",
	"Items.LegendaryCasualShoesRecipe",
	"Items.Boots_07_old_02",
	"Items.FormalShoes_01_basic_03",
	"Items.CasualShoes_05_old_03",
	"Items.Boots_06_old_02",
	"Items.Boots_10_rich_01",
	"Items.CasualShoes_06_rich_02",
	"Items.Boots_07_basic_01",
	"Items.CasualShoes_05_basic_03",
	"Items.Boots_02_rich_02",
	"Items.Boots_04_old_03",
	"Items.Boots_07_old_03",
	"Items.Boots_06_basic_01",
	"Items.Boots_03_basic_01",
	"Items.Boots_09_basic_01",
	"Items.Boots_04_basic_03",
	"Items.Boots_05_basic_03",
	"Items.CasualShoes_07_old_01",
	"Items.Q204_Epilogue_Boots",
	"Items.Q005_Johnny_Shoes",
	"Items.CasualShoes_07_rich_01",
	"Items.FormalShoes_02_rich_02",
	"Items.CasualShoes_07_basic_02",
	"Items.Boots_11_basic_01",
	"Items.Boots_03_rich_01",
	"Items.Boots_06_rich_02",
	"Items.CasualShoes_07_basic_04",
	"Items.FormalShoes_01_rich_02",
	"Items.Boots_09_rich_01",
	"Items.CasualShoes_02_basic_02",
	"Items.Boots_05_old_01",
	"Items.Boots_09_rich_02",
	"Items.CasualShoes_07_old_02",
	"Items.Boots_08_basic_01",
	"Items.CasualShoes_05_rich_01",
	"Items.Boots_11_rich_02",
	"Items.Boots_11_rich_01",
	"Items.Boots_06_old_01",
	"Items.CasualShoes_01_basic_04",
	"Items.CasualShoes_05_rich_03",
	"Items.Boots_03_basic_02",
	"Items.FormalShoes_03_basic_01",
	"Items.Boots_05_old_03",
	"Items.Boots_09_rich_03",
	"Items.Boots_10_old_02",
	"Items.Boots_08_basic_02",
	"Items.Boots_01_basic_01",
	"Items.FormalShoes_02_basic_01",
	"Items.Boots_11_old_02",
	"Items.Boots_08_old_01",
	"Items.q115_thrusters",
	"Items.CasualShoes_06_basic_02",
	"Items.CasualShoes_07_basic_01",
	"Items.RareCasualShoesRecipe",
	"Items.Boots_06_rich_01",
	"Items.Boots_03_old_02",
	"Items.CasualShoes_05_old_02",
	"Items.Boots_10_old_01",
	"Items.CasualShoes_01_old_02",
	"Items.CasualShoes_06_old_02",
	"Items.FormalShoes_01_rich_01",
	"Items.FormalShoes_02_rich_01",
	"Items.FormalShoes_01_basic_01",
	"Items.CasualShoes_04_old_01",
	"Items.Boots_06_basic_02",
	"Items.Boots_04_basic_01",
	"Items.Boots_01_rich_01",
	"Items.CasualShoes_06_basic_01",
	"Items.CasualShoes_01_basic_05",
	"Items.Boots_07_old_01",
	"Items.Boots_03_rich_02",
	"Items.Boots_07_rich_02",
	"Items.CasualShoes_01_basic_01",
	"Items.CasualShoes_05_rich_02",
	"Items.CasualShoes_04_old_02",
	"Items.Boots_04_old_02",
	"Items.Boots_01_old_01",
	"Items.Boots_10_rich_02",
	"Items.Boots_09_basic_02",
	"Items.CasualShoes_01_basic_03",
	"Items.Boots_05_basic_02",
	"Items.Boots_04_old_01",
	"Items.CasualShoes_05_old_01",
	"Items.Boots_05_old_02",
	"Items.Boots_02_basic_02",
	"Items.Q203_Epilogue_Boots",
	"Items.Q202_Epilogue_Boots",
	"Items.Q000_Nomad_Boots",
	"Items.Q000_Corpo_FormalShoes",
	"Items.Q000_StreetKid_Shoes",
	"Items.Boots_03_old_01",
	"Items.Boots_10_basic_01",
	"Items.FormalShoes_03_basic_02",
	"Items.CasualShoes_01_old_01",
	"Items.Boots_02_old_02",
	"Items.Boots_09_old_02",
	"Items.Boots_02_old_01",
	"Items.CasualShoes_07_old_03",
	"Items.Boots_10_basic_02",
	"Items.CasualShoes_07_rich_03",
	"Items.Boots_11_basic_02",
	"Items.CasualShoes_05_basic_02",
	"Items.Cap_05_old_01",
	"Items.Helmet_02_rich_02",
	"Items.Scarf_01_old_01",
	"Items.Helmet_04_rich_01",
	"Items.Cap_04_old_02",
	"Items.Helmet_03_basic_02",
	"Items.Helmet_04_basic_01",
	"Items.Cap_03_basic_02",
	"Items.Balaclava_01_old_01",
	"Items.Cap_01_rich_03",
	"Items.Scarf_01_old_02",
	"Items.Hat_01_rich_01",
	"Items.Cap_01_old_02",
	"Items.Cap_04_old_01",
	"Items.Cap_05_basic_01",
	"Items.Hat_04_basic_02",
	"Items.Cap_04_basic_02",
	"Items.Helmet_02_rich_01",
	"Items.Cap_02_basic_02",
	"Items.Cap_05_basic_02",
	"Items.Hat_01_basic_01",
	"Items.Helmet_02_basic_04",
	"Items.Scarf_01_old_03",
	"Items.Scarf_01_basic_02",
	"Items.Helmet_01_rich_02",
	"Items.Cap_06_basic_01",
	"Items.Hat_02_basic_01",
	"Items.Helmet_02_rich_04",
	"Items.Scarf_01_rich_02",
	"Items.Cap_01_basic_01",
	"Items.Balaclava_01_basic_02",
	"Items.Helmet_01_basic_01",
	"Items.Scarf_03_basic_02",
	"Items.Hat_03_rich_01",
	"Items.Scarf_03_old_02",
	"Items.Cap_03_rich_02",
	"Items.Helmet_01_basic_03",
	"Items.Scarf_03_old_03",
	"Items.Scarf_02_old_01",
	"Items.Cap_01_rich_02",
	"Items.Hat_01_rich_02",
	"Items.Cap_02_old_02",
	"Items.Cap_02_basic_03",
	"Items.Cap_06_rich_02",
	"Items.Scarf_03_basic_03",
	"Items.Scarf_03_rich_01",
	"Items.Hat_02_rich_01",
	"Items.Helmet_04_rich_02",
	"Items.Cap_06_basic_02",
	"Items.Cap_04_rich_01",
	"Items.Cap_03_rich_01",
	"Items.Scarf_03_rich_03",
	"Items.Hat_03_basic_01",
	"Items.EpicHelmetRecipe",
	"Items.Helmet_03_basic_01",
	"Items.Scarf_03_basic_01",
	"Items.Helmet_01_basic_02",
	"Items.Cap_01_basic_02",
	"Items.Cap_05_old_02",
	"Items.Scarf_01_rich_03",
	"Items.Scarf_01_basic_01",
	"Items.SQ030_MaxTac_Helmet",
	"Items.Helmet_02_basic_03",
	"Items.Hat_02_rich_02",
	"Items.Helmet_01_rich_01",
	"Items.Cap_03_basic_01",
	"Items.Helmet_03_rich_01",
	"Items.Balaclava_01_old_02",
	"Items.Cap_05_basic_03",
	"Items.Helmet_03_old_01",
	"Items.Helmet_02_old_02",
	"Items.Cap_06_old_02",
	"Items.Cap_03_old_02",
	"Items.Balaclava_01_basic_01",
	"Items.Cap_02_old_03",
	"Items.Helmet_04_old_01",
	"Items.Helmet_02_basic_01",
	"Items.Scarf_02_old_02",
	"Items.Cap_01_basic_03",
	"Items.Hat_02_basic_02",
	"Items.Scarf_02_basic_02",
	"Items.Helmet_02_old_03",
	"Items.Helmet_03_old_02",
	"Items.Balaclava_01_rich_02",
	"Items.Scarf_02_rich_01",
	"Items.Helmet_01_old_01",
	"Items.Scarf_02_basic_01",
	"Items.Cap_06_old_01",
	"Items.Hat_01_basic_02",
	"Items.Q203_Spacesuit_Helmet",
	"Items.Helmet_02_basic_02",
	"Items.Helmet_04_basic_02",
	"Items.RareHelmetRecipe",
	"Items.Cap_01_rich_01",
	"Items.Scarf_01_basic_03",
	"Items.Hat_04_basic_01",
	"Items.Cap_02_old_01",
	"Items.Cap_02_basic_01",
	"Items.Helmet_02_rich_03",
	"Items.Scarf_03_old_01",
	"Items.Cap_06_rich_01",
	"Items.Scarf_01_rich_01",
	"Items.Balaclava_01_rich_01",
	"Items.Cap_04_basic_01",
	"Items.Helmet_04_old_02",
	"Items.Hat_03_basic_02",
	"Items.Helmet_02_old_04",
	"Items.Scarf_03_rich_02",
	"Items.Cap_01_old_01",
	"Items.Cap_03_old_01",
	"Items.Helmet_02_old_01",
	"Items.Cap_01_old_03",
	"Items.SQ023_Switchblade_Shirt",
	"Items.FormalShirt_01_rich_02",
	"Items.TShirt_11_rich_01",
	"Items.TShirt_08_rich_01",
	"Items.TShirt_01_old_01",
	"Items.Shirt_02_old_01",
	"Items.Shirt_02_basic_03",
	"Items.FormalShirt_02_basic_02",
	"Items.Shirt_03_rich_02",
	"Items.Undershirt_03_basic_02",
	"Items.TShirt_01_basic_01",
	"Items.TShirt_06_basic_02",
	"Items.TShirt_06_old_01",
	"Items.TShirt_04_old_03",
	"Items.Shirt_03_rich_01",
	"Items.Shirt_01_basic_01",
	"Items.TShirt_03_basic_03",
	"Items.FormalShirt_02_basic_04",
	"Items.FormalShirt_01_old_02",
	"Items.TightJumpsuit_01_rich_01",
	"Items.Shirt_03_basic_02",
	"Items.TShirt_02_rich_03",
	"Items.Shirt_01_old_01",
	"Items.FormalShirt_01_old_01",
	"Items.TShirt_01_rich_02",
	"Items.FormalShirt_01_rich_01",
	"Items.Shirt_03_rich_03",
	"Items.TShirt_02_basic_03",
	"Items.FormalShirt_02_rich_01",
	"Items.TShirt_02_old_03",
	"Items.FormalShirt_01_rich_04",
	"Items.Shirt_02_old_03",
	"Items.TShirt_03_basic_02",
	"Items.TShirt_08_basic_01",
	"Items.TShirt_03_basic_01",
	"Items.TShirt_08_old_01",
	"Items.Undershirt_02_basic_02",
	"Items.TShirt_04_old_02",
	"Items.Shirt_03_old_02",
	"Items.TShirt_10_basic_01",
	"Items.GOG_Galaxy_TShirt",
	"Items.Shirt_01_rich_02",
	"Items.FormalShirt_01_rich_05",
	"Items.TShirt_07_basic_01",
	"Items.TShirt_10_old_01",
	"Items.TShirt_04_old_01",
	"Items.Q201_SpaceHospitalShirt",
	"Items.Q005_Johnny_Shirt",
	"Items.Q204_Epilogue_TShirt",
	"Items.TShirt_08_basic_02",
	"Items.TightJumpsuit_01_basic_02",
	"Items.Shirt_02_rich_01",
	"Items.FormalShirt_02_old_01",
	"Items.FormalShirt_02_rich_03",
	"Items.Shirt_01_old_02",
	"Items.FormalShirt_01_rich_03",
	"Items.TShirt_01_basic_02",
	"Items.TightJumpsuit_01_basic_01",
	"Items.TShirt_03_old_03",
	"Items.TShirt_08_rich_02",
	"Items.TShirt_03_rich_01",
	"Items.TShirt_07_basic_02",
	"Items.TShirt_06_basic_01",
	"Items.TShirt_06_old_02",
	"Items.Shirt_03_old_01",
	"Items.TShirt_02_old_02",
	"Items.TightJumpsuit_01_old_02",
	"Items.TShirt_01_old_03",
	"Items.Undershirt_02_rich_02",
	"Items.Shirt_03_basic_03",
	"Items.Shirt_02_old_02",
	"Items.FormalShirt_02_rich_02",
	"Items.FormalShirt_01_rich_06",
	"Items.FormalShirt_01_old_03",
	"Items.Shirt_01_basic_02",
	"Items.TShirt_02_rich_01",
	"Items.TShirt_07_rich_01",
	"Items.TShirt_02_basic_04",
	"Items.TShirt_01_old_02",
	"Items.TShirt_01_basic_03",
	"Items.TShirt_06_rich_01",
	"Items.FormalShirt_02_old_02",
	"Items.TightJumpsuit_01_rich_02",
	"Items.FormalShirt_02_basic_03",
	"Items.Undershirt_03_rich_02",
	"Items.FormalShirt_01_basic_02",
	"Items.Undershirt_02_basic_01",
	"Items.TShirt_11_basic_01",
	"Items.TShirt_09_basic_01",
	"Items.TShirt_09_old_01",
	"Items.SQ029_River_Romance_Shirt",
	"Items.TShirt_02_old_01",
	"Items.TShirt_10_rich_01",
	"Items.SamuraiWorldTour_TShirt",
	"Items.Shirt_02_basic_04",
	"Items.TShirt_01_rich_03",
	"Items.TShirt_03_rich_02",
	"Items.TShirt_07_rich_02",
	"Items.TShirt_08_old_02",
	"Items.TShirt_04_old_05",
	"Items.FormalShirt_02_basic_01",
	"Items.Shirt_02_basic_02",
	"Items.Undershirt_03_basic_01",
	"Items.Shirt_02_rich_02",
	"Items.Shirt_02_basic_01",
	"Items.Undershirt_03_basic_04",
	"Items.TShirt_03_old_01",
	"Items.TShirt_05_old_06",
	"Items.TShirt_04_old_06",
	"Items.Undershirt_03_basic_03",
	"Items.TShirt_02_rich_02",
	"Items.Shirt_01_rich_01",
	"Items.FormalShirt_01_basic_03",
	"Items.Shirt_03_basic_01",
	"Items.TShirt_07_old_01",
	"Items.TShirt_09_basic_02",
	"Items.FormalShirt_01_basic_01",
	"Items.TShirt_05_old_01",
	"Items.TShirt_05_old_02",
	"Items.TShirt_05_old_03",
	"Items.TShirt_09_old_02",
	"Items.TShirt_05_old_05",
	"Items.TShirt_05_old_04",
	"Items.TShirt_02_basic_02",
	"Items.Undershirt_02_rich_01",
	"Items.TShirt_01_rich_01",
	"Items.Undershirt_03_rich_01",
	"Items.TShirt_03_rich_03",
	"Items.TShirt_02_basic_01",
	"Items.TShirt_02_old_04",
	"Items.TShirt_02_basic_05",
	"Items.Shirt_02_rich_03",
	"Items.Q202_Epilogue_TShirt",
	"Items.Q203_Epilogue_TShirt",
	"Items.Q000_Nomad_TShirt",
	"Items.Q000_StreetKid_TShirt",
	"Items.GOG_DLC_TShirt",
	"Items.Shirt_03_old_03",
	"Items.TightJumpsuit_01_old_01",
	"Items.TShirt_03_old_02",
	"Items.FormalShirt_02_old_03",
	"Items.TShirt_06_rich_02",
	"Items.TShirt_04_old_04",
	"Items.Q005_Yorinobu_FormalShirt",
	"Items.TShirt_07_old_02",
	"Items.TShirt_02_rich_04",
	"Items.SQ023_Switchblade_Pants",
	"Items.Pants_11_old_03",
	"Items.Pants_10_basic_01",
	"Items.Pants_09_basic_01",
	"Items.Shorts_01_old_02",
	"Items.FormalSkirt_01_rich_03",
	"Items.Pants_11_basic_01",
	"Items.Pants_12_basic_03",
	"Items.Pants_09_rich_01",
	"Items.Shorts_03_basic_02",
	"Items.Shorts_02_basic_01",
	"Items.Pants_07_rich_02",
	"Items.FormalPants_02_rich_01",
	"Items.Pants_03_basic_03",
	"Items.Shorts_02_basic_02",
	"Items.Pants_08_basic_02",
	"Items.Pants_07_rich_01",
	"Items.FormalSkirt_02_rich_02",
	"Items.FormalSkirt_02_basic_02",
	"Items.Pants_03_basic_02",
	"Items.Pants_11_basic_02",
	"Items.FormalSkirt_02_rich_03",
	"Items.Pants_02_rich_02",
	"Items.Shorts_01_basic_01",
	"Items.Shorts_03_basic_01",
	"Items.FormalPants_01_basic_02",
	"Items.FormalPants_02_basic_01",
	"Items.FormalSkirt_01_basic_02",
	"Items.FormalPants_02_basic_02",
	"Items.Shorts_05_old_05",
	"Items.Pants_01_basic_01",
	"Items.Pants_07_basic_03",
	"Items.Pants_13_rich_01",
	"Items.Shorts_02_rich_02",
	"Items.Pants_01_old_02",
	"Items.Shorts_01_old_01",
	"Items.Shorts_04_old_01",
	"Items.Pants_09_old_03",
	"Items.Pants_10_old_02",
	"Items.Pants_06_rich_01",
	"Items.Pants_04_rich_03",
	"Items.Pants_10_basic_02",
	"Items.Pants_03_rich_02",
	"Items.Pants_07_rich_03",
	"Items.Pants_01_rich_03",
	"Items.Shorts_04_old_03",
	"Items.Pants_06_old_02",
	"Items.Pants_02_old_01",
	"Items.Pants_01_old_03",
	"Items.Pants_01_rich_02",
	"Items.FormalPants_01_basic_03",
	"Items.Pants_03_old_03",
	"Items.FormalSkirt_01_basic_01",
	"Items.Pants_02_basic_01",
	"Items.Pants_12_basic_01",
	"Items.Pants_15_old_01",
	"Items.Pants_08_basic_03",
	"Items.Shorts_04_old_04",
	"Items.FormalPants_02_basic_03",
	"Items.Pants_15_basic_01",
	"Items.Pants_05_basic_02",
	"Items.Shorts_04_old_02",
	"Items.Pants_07_old_03",
	"Items.Pants_03_old_01",
	"Items.Pants_04_basic_01",
	"Items.Pants_07_basic_02",
	"Items.Pants_08_rich_01",
	"Items.FormalPants_02_rich_03",
	"Items.FormalSkirt_01_rich_01",
	"Items.Shorts_02_rich_01",
	"Items.Pants_12_rich_03",
	"Items.Pants_06_rich_02",
	"Items.Shorts_05_old_04",
	"Items.Shorts_03_rich_01",
	"Items.Pants_05_rich_01",
	"Items.Pants_10_old_01",
	"Items.Pants_13_rich_02",
	"Items.SQ030_MaxTac_Pants",
	"Items.Pants_04_rich_01",
	"Items.FormalSkirt_02_rich_01",
	"Items.Pants_02_rich_01",
	"Items.Q201_SpaceHospitalPants",
	"Items.FormalPants_03_rich_01",
	"Items.Q005_Johnny_Pants",
	"Items.Q204_Epilogue_Pants",
	"Items.Pants_04_basic_03",
	"Items.Pants_01_basic_02",
	"Items.Shorts_05_old_03",
	"Items.Pants_13_basic_03",
	"Items.Pants_14_basic_01",
	"Items.Pants_03_rich_01",
	"Items.Shorts_02_old_02",
	"Items.Pants_02_old_03",
	"Items.Shorts_01_rich_01",
	"Items.Pants_04_basic_02",
	"Items.Pants_12_old_01",
	"Items.Pants_14_rich_01",
	"Items.Pants_09_basic_02",
	"Items.Pants_05_old_01",
	"Items.Pants_08_basic_01",
	"Items.FormalSkirt_01_rich_02",
	"Items.FormalPants_03_old_01",
	"Items.Shorts_03_basic_03",
	"Items.Pants_11_old_02",
	"Items.Pants_08_rich_03",
	"Items.Pants_08_old_01",
	"Items.Pants_07_old_01",
	"Items.Shorts_05_old_01",
	"Items.Shorts_03_old_01",
	"Items.Pants_12_old_02",
	"Items.Shorts_01_old_03",
	"Items.Pants_03_old_02",
	"Items.Pants_09_old_02",
	"Items.Pants_11_basic_03",
	"Items.Pants_15_rich_01",
	"Items.FormalSkirt_01_basic_03",
	"Items.Pants_11_rich_03",
	"Items.Pants_05_old_02",
	"Items.Pants_03_rich_03",
	"Items.Pants_05_basic_01",
	"Items.Pants_02_rich_03",
	"Items.Pants_11_rich_02",
	"Items.FormalPants_01_old_01",
	"Items.Pants_06_basic_01",
	"Items.Pants_06_old_03",
	"Items.Pants_04_old_02",
	"Items.Pants_01_rich_01",
	"Items.Pants_13_old_02",
	"Items.FormalPants_02_rich_02",
	"Items.Pants_04_old_03",
	"Items.Pants_14_rich_02",
	"Items.FormalSkirt_02_basic_03",
	"Items.Pants_04_basic_04",
	"Items.Pants_08_old_02",
	"Items.Pants_12_old_03",
	"Items.Pants_04_rich_02",
	"Items.FormalPants_03_basic_01",
	"Items.Pants_14_old_01",
	"Items.Pants_11_rich_01",
	"Items.Pants_06_basic_02",
	"Items.FormalPants_03_old_02",
	"Items.Pants_15_basic_02",
	"Items.Pants_01_old_01",
	"Items.Pants_02_basic_03",
	"Items.Pants_10_rich_02",
	"Items.FormalPants_01_basic_01",
	"Items.Pants_03_basic_01",
	"Items.Pants_01_basic_03",
	"Items.Pants_12_rich_01",
	"Items.Pants_07_basic_01",
	"Items.Pants_12_basic_02",
	"Items.Shorts_05_old_02",
	"Items.Pants_11_old_01",
	"Items.FormalPants_01_old_02",
	"Items.Pants_09_rich_02",
	"Items.FormalSkirt_02_basic_01",
	"Items.Pants_10_rich_01",
	"Items.Pants_12_rich_02",
	"Items.Pants_14_basic_02",
	"Items.Shorts_02_old_01",
	"Items.Pants_13_old_01",
	"Items.FormalSkirt_01_basic_04",
	"Items.FormalPants_03_rich_02",
	"Items.Pants_08_rich_02",
	"Items.Pants_13_basic_01",
	"Items.Pants_06_old_01",
	"Items.Q203_Epilogue_Pants",
	"Items.Q000_Nomad_Pants",
	"Items.Q000_Corpo_FormalPants",
	"Items.Q000_StreetKid_Pants",
	"Items.Pants_02_old_02",
	"Items.Pants_04_old_01",
	"Items.Pants_07_old_02",
	"Items.Pants_13_old_03",
	"Items.Pants_08_old_03",
	"Items.Pants_13_basic_02",
	"Items.Pants_09_old_01",
	"Items.Q005_Yorinobu_FormalPants",
	"Items.Pants_05_rich_02",
	"Items.Pants_02_basic_02",
	"Items.Pants_14_old_02",
	"Items.Vest_13_rich_04",
	"Items.Jacket_17_old_03",
	"Items.Coat_03_old_03",
	"Items.Vest_03_old_02",
	"Items.Vest_10_old_02",
	"Items.Vest_06_old_01",
	"Items.Jacket_07_basic_02",
	"Items.Vest_18_rich_01",
	"Items.Jacket_04_rich_01",
	"Items.Jacket_15_rich_01",
	"Items.Jacket_09_old_01",
	"Items.Q114_Aldecaldo_Jacket",
	"Items.Vest_03_rich_01",
	"Items.Jacket_10_basic_01",
	"Items.Vest_18_rich_02",
	"Items.Vest_06_rich_01",
	"Items.Jumpsuit_01_basic_01",
	"Items.Vest_10_rich_01",
	"Items.Jacket_13_old_02",
	"Items.LooseShirt_02_rich_01",
	"Items.Vest_07_basic_01",
	"Items.FormalJacket_01_old_02",
	"Items.Jumpsuit_01_old_02",
	"Items.FormalJacket_05_basic_02",
	"Items.Dress_02_basic_02",
	"Items.FormalJacket_02_basic_01",
	"Items.Vest_01_basic_02",
	"Items.Vest_12_basic_01",
	"Items.Vest_06_rich_03",
	"Items.Jacket_14_rich_02",
	"Items.Jacket_05_basic_01",
	"Items.Coat_02_old_01",
	"Items.Jacket_02_rich_02",
	"Items.LooseShirt_01_rich_01",
	"Items.Vest_13_rich_02",
	"Items.Vest_19_basic_01",
	"Items.Jacket_03_basic_01",
	"Items.Jacket_10_rich_01",
	"Items.Coat_01_basic_02",
	"Items.SQ021_Wraiths_Vest",
	"Items.FormalJacket_05_rich_01",
	"Items.Vest_04_basic_01",
	"Items.Vest_07_basic_03",
	"Items.Jacket_11_basic_02",
	"Items.Jacket_16_rich_01",
	"Items.Jacket_01_basic_02",
	"Items.Jacket_15_basic_02",
	"Items.Vest_14_rich_01",
	"Items.Vest_08_rich_01",
	"Items.Jacket_02_rich_01",
	"Items.Jacket_11_rich_02",
	"Items.Vest_15_old_01",
	"Items.Jacket_06_rich_02",
	"Items.Jacket_01_rich_02",
	"Items.Jacket_12_basic_02",
	"Items.Vest_03_basic_02",
	"Items.Vest_01_basic_01",
	"Items.Vest_08_old_01",
	"Items.Jacket_07_old_01",
	"Items.Dress_02_rich_02",
	"Items.Coat_01_old_03",
	"Items.Vest_15_basic_02",
	"Items.Jacket_11_old_01",
	"Items.Vest_08_old_02",
	"Items.Vest_18_old_01",
	"Items.Vest_15_basic_03",
	"Items.Jacket_17_basic_01",
	"Items.Coat_01_rich_02",
	"Items.Jacket_17_basic_02",
	"Items.Jacket_17_old_01",
	"Items.Jacket_03_old_02",
	"Items.LooseShirt_01_old_02",
	"Items.Vest_14_rich_02",
	"Items.Vest_16_rich_01",
	"Items.FormalJacket_03_basic_01",
	"Items.Coat_02_basic_02",
	"Items.Jacket_10_old_02",
	"Items.LooseShirt_02_old_01",
	"Items.Jacket_16_basic_01",
	"Items.Vest_13_basic_02",
	"Items.Vest_15_old_03",
	"Items.Vest_01_rich_01",
	"Items.EpicFormalJacketRecipe",
	"Items.FormalJacket_04_basic_02",
	"Items.Vest_11_rich_01",
	"Items.Vest_04_rich_02",
	"Items.Jacket_15_old_01",
	"Items.Coat_02_old_02",
	"Items.Jacket_17_rich_06",
	"Items.Vest_06_rich_02",
	"Items.Dress_01_rich_02",
	"Items.Jacket_12_basic_01",
	"Items.LooseShirt_02_basic_02",
	"Items.Jacket_01_rich_01",
	"Items.FormalJacket_02_rich_02",
	"Items.Vest_06_old_02",
	"Items.LooseShirt_02_basic_01",
	"Items.Coat_02_basic_01",
	"Items.Jacket_16_old_01",
	"Items.FormalJacket_02_basic_02",
	"Items.Vest_07_old_02",
	"Items.Jumpsuit_01_old_01",
	"Items.Coat_02_old_04",
	"Items.Coat_03_basic_01",
	"Items.Dress_02_basic_01",
	"Items.Jacket_01_old_02",
	"Items.FormalJacket_02_rich_03",
	"Items.Dress_01_basic_03",
	"Items.Vest_19_basic_02",
	"Items.Jumpsuit_01_rich_02",
	"Items.Vest_02_basic_01",
	"Items.Vest_07_basic_02",
	"Items.Coat_04_rich_01",
	"Items.mq017_SameraiJacket",
	"Items.Vest_16_rich_02",
	"Items.FormalJacket_03_rich_01",
	"Items.Vest_17_basic_02",
	"Items.Vest_06_rich_04",
	"Items.Jacket_02_old_01",
	"Items.FormalJacket_05_basic_03",
	"Items.FormalJacket_04_rich_01",
	"Items.Jacket_09_rich_01",
	"Items.FormalJacket_05_rich_03",
	"Items.Jacket_05_rich_02",
	"Items.Coat_01_rich_01",
	"Items.Jacket_03_basic_02",
	"Items.Vest_07_old_03",
	"Items.Vest_11_rich_02",
	"Items.LooseShirt_02_old_02",
	"Items.Dress_01_rich_03",
	"Items.Vest_15_basic_01",
	"Items.Jacket_11_old_02",
	"Items.Jacket_06_old_01",
	"Items.Jacket_05_old_02",
	"Items.FormalJacket_03_basic_03",
	"Items.Coat_02_old_03",
	"Items.Coat_03_rich_02",
	"Items.LooseShirt_01_rich_02",
	"Items.Jacket_03_rich_02",
	"Items.Vest_18_basic_02",
	"Items.Vest_20_basic_01",
	"Items.Jacket_06_basic_01",
	"Items.Vest_17_basic_01",
	"Items.Vest_20_basic_02",
	"Items.Vest_02_rich_01",
	"Items.Vest_11_basic_02",
	"Items.Vest_08_basic_02",
	"Items.Jacket_09_basic_02",
	"Items.Vest_13_rich_03",
	"Items.Q005_Steel_Dragons_Coat",
	"Items.Coat_04_basic_03",
	"Items.Coat_03_basic_02",
	"Items.Vest_14_basic_02",
	"Items.Dress_01_rich_01",
	"Items.Jacket_14_rich_01",
	"Items.Jacket_06_basic_02",
	"Items.Jacket_17_rich_03",
	"Items.Vest_20_old_02",
	"Items.Jacket_12_rich_02",
	"Items.Jacket_13_basic_03",
	"Items.FormalJacket_04_basic_01",
	"Items.Jumpsuit_02_rich_03",
	"Items.FormalJacket_02_rich_01",
	"Items.LooseShirt_01_basic_01",
	"Items.Vest_01_rich_02",
	"Items.Vest_17_rich_02",
	"Items.Vest_07_rich_03",
	"Items.FormalJacket_01_rich_01",
	"Items.Jumpsuit_02_old_02",
	"Items.SQ030_MaxTac_Chest",
	"Items.Jacket_17_basic_04",
	"Items.Jacket_08_old_02",
	"Items.Vest_14_basic_01",
	"Items.Jacket_10_basic_02",
	"Items.Vest_12_old_01",
	"Items.Vest_02_old_02",
	"Items.Vest_06_basic_01",
	"Items.Vest_02_rich_02",
	"Items.Vest_08_basic_01",
	"Items.Jacket_04_basic_02",
	"Items.Vest_13_basic_01",
	"Items.Coat_04_rich_02",
	"Items.Jacket_11_basic_01",
	"Items.Coat_03_rich_01",
	"Items.FormalJacket_01_rich_02",
	"Items.Vest_12_basic_02",
	"Items.Vest_11_old_01",
	"Items.Jacket_13_rich_03",
	"Items.Vest_19_rich_02",
	"Items.Vest_16_basic_02",
	"Items.Jumpsuit_02_rich_02",
	"Items.Jumpsuit_02_rich_01",
	"Items.Vest_12_old_02",
	"Items.Vest_03_basic_01",
	"Items.Jacket_11_rich_01",
	"Items.Jacket_05_rich_01",
	"Items.Jacket_04_rich_03",
	"Items.FormalJacket_04_rich_03",
	"Items.Vest_14_old_01",
	"Items.Jacket_04_rich_02",
	"Items.Jacket_03_rich_03",
	"Items.Vest_11_old_02",
	"Items.Vest_10_old_01",
	"Items.Vest_04_old_01",
	"Items.Jacket_03_old_01",
	"Items.Jacket_04_old_01",
	"Items.Vest_01_old_02",
	"Items.Coat_04_old_01",
	"Items.Jacket_09_old_02",
	"Items.Jacket_07_old_02",
	"Items.Jacket_02_old_02",
	"Items.FormalJacket_03_rich_03",
	"Items.Jacket_15_basic_01",
	"Items.Dress_02_rich_01",
	"Items.Vest_04_basic_02",
	"Items.Coat_04_basic_02",
	"Items.Jumpsuit_01_basic_02",
	"Items.Jumpsuit_01_old_03",
	"Items.FormalJacket_01_basic_01",
	"Items.Jacket_13_basic_01",
	"Items.Jumpsuit_02_basic_02",
	"Items.Vest_18_basic_01",
	"Items.FormalJacket_02_basic_03",
	"Items.Vest_03_rich_02",
	"Items.LooseShirt_01_old_01",
	"Items.Jacket_12_old_02",
	"Items.Coat_01_old_02",
	"Items.Vest_02_old_01",
	"Items.Jacket_05_basic_02",
	"Items.Vest_07_old_01",
	"Items.Jacket_08_basic_02",
	"Items.Jacket_08_basic_01",
	"Items.Jacket_02_basic_02",
	"Items.Jumpsuit_01_basic_03",
	"Items.Jacket_03_rich_01",
	"Items.FormalJacket_03_rich_02",
	"Items.Vest_11_basic_01",
	"Items.Vest_16_old_02",
	"Items.Jacket_12_old_01",
	"Items.Jacket_02_basic_01",
	"Items.SQ031_Samurai_Jacket",
	"Items.Jacket_06_old_02",
	"Items.Jacket_01_old_01",
	"Items.Vest_20_rich_02",
	"Items.Jacket_06_rich_01",
	"Items.Dress_01_basic_02",
	"Items.Vest_13_rich_01",
	"Items.Jacket_12_rich_01",
	"Items.LooseShirt_02_rich_02",
	"Items.Jacket_17_rich_01",
	"Items.FormalJacket_04_rich_02",
	"Items.Vest_03_old_01",
	"Items.Jacket_07_basic_01",
	"Items.Dress_02_rich_03",
	"Items.Jacket_05_old_01",
	"Items.Jacket_16_basic_02",
	"Items.Jacket_02_old_03",
	"Items.Vest_14_old_02",
	"Items.MQ017_Samerai_Jacket",
	"Items.Vest_01_old_01",
	"Items.Vest_15_old_02",
	"Items.Vest_07_rich_01",
	"Items.Vest_16_old_01",
	"Items.Jacket_14_basic_02",
	"Items.Vest_20_rich_01",
	"Items.Jacket_14_basic_01",
	"Items.Jacket_04_basic_03",
	"Items.Jacket_07_rich_02",
	"Items.Jacket_13_basic_02",
	"Items.Jacket_13_rich_01",
	"Items.Jacket_08_old_01",
	"Items.Dress_02_basic_03",
	"Items.Coat_01_basic_01",
	"Items.Coat_03_old_01",
	"Items.Jumpsuit_01_rich_01",
	"Items.Jacket_13_old_03",
	"Items.Vest_20_old_01",
	"Items.Vest_10_basic_01",
	"Items.FormalJacket_01_old_01",
	"Items.Jacket_14_old_01",
	"Items.Coat_01_basic_03",
	"Items.Coat_01_rich_03",
	"Items.FormalJacket_03_basic_02",
	"Items.Jacket_17_old_02",
	"Items.FormalJacket_05_basic_01",
	"Items.Vest_19_old_01",
	"Items.Jacket_13_old_01",
	"Items.Vest_16_basic_01",
	"Items.Jacket_10_rich_02",
	"Items.Jacket_04_old_03",
	"Items.Jumpsuit_02_old_01",
	"Items.Jacket_09_basic_01",
	"Items.Jacket_16_old_02",
	"Items.Jacket_04_basic_01",
	"Items.FormalJacket_04_basic_03",
	"Items.Coat_04_old_02",
	"Items.Jacket_17_rich_02",
	"Items.Jacket_01_basic_01",
	"Items.Vest_08_rich_02",
	"Items.Vest_12_rich_01",
	"Items.Jacket_03_basic_03",
	"Items.Vest_06_basic_02",
	"Items.Jacket_17_rich_04",
	"Items.Vest_02_basic_02",
	"Items.Coat_04_basic_01",
	"Items.Vest_07_rich_02",
	"Items.Vest_12_rich_02",
	"Items.Jacket_17_rich_05",
	"Items.Jacket_03_basic_04",
	"Items.Vest_10_basic_02",
	"Items.Dress_01_basic_01",
	"Items.Vest_04_rich_01",
	"Items.Jacket_17_basic_03",
	"Items.Q000_Corpo_FormalJacket",
	"Items.Q000_Nomad_Vest",
	"Items.Q000_Nomad_noPatch_Vest",
	"Items.Vest_19_rich_01",
	"Items.LooseShirt_01_basic_02",
	"Items.Vest_17_rich_01",
	"Items.Jacket_03_old_04",
	"Items.GOG_DLC_Jacket",
	"Items.FormalJacket_01_basic_02",
	"Items.Coat_01_old_01",
	"Items.Jacket_04_old_02",
	"Items.Vest_04_old_02",
	"Items.Jacket_02_rich_03",
	"Items.Coat_03_old_02",
	"Items.Vest_10_rich_02",
	"Items.Jacket_09_rich_02",
	"Items.Jacket_10_old_01",
	"Items.Jacket_03_old_03",
	"Items.Jacket_13_rich_02",
	"Items.Jumpsuit_02_basic_01",
	"Items.FormalJacket_05_rich_02",
	"Items.Jacket_07_rich_01",
	"Items.Q115_Afterlife_Netrunner",
	"Items.Jumpsuit_03_old_01",
	"Items.Q005_Militech_Suit_Dirty",
	"Items.SQ023_Joshua_Prisonwear",
	"Items.SQ021_Lab_Costume",
	"Items.Jumpsuit_03_old_03",
	"Items.Jumpsuit_03_old_02",
	"Items.SQ030_Diving_Suit_NoShoes",
	"Items.SQ030_Diving_Suit",
	"Items.SQ029_Police_Suit",
	"Items.Q005_Militech_Suit_Filthy",
	"Items.Q114_Cyberspace_Jumpsuit",
	"Items.Q000_half_Corpo",
	"Items.Q000_half_Nomad",
	"Items.Q000_half_StreetKid"
}

function ItemsManager.Clothes()
    return ClothesList
end

return ItemsManager