local tbl = 
{
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Cherry\\DMU\\Autosim\\Autosim",
				uuid = "3a8e5222-680e-9396-dbac-a2707e4020d2",
			},
			inheritanceRoot = "Cherry\\DMU\\Autosim\\Autosim",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "c93eaeae-104c-d4aa-90de-ac00c5836b7e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "f8e0d064-c8ed-37a0-487b-5cced11ca474",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"ec99b84e-4861-1f46-b1cd-c8bae0586108",
									true,
								},
							},
							gVar = "ACR_TensorViper4_Potion",
							gVarValue = 2,
							holdActionDuration = 110,
							holdActionID = 846,
							uuid = "22a7de20-6cb6-7ba1-8b13-0b070fa537cd",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Event",
							eventCountdownTime = 5,
							uuid = "ec99b84e-4861-1f46-b1cd-c8bae0586108",
							version = 3,
						},
					},
				},
				enabled = false,
				eventType = 16,
				mechanicTime = 15.261765625,
				name = "Disable pot toggle",
				timelineIndex = 1,
				timerOffset = -15.300000190735,
				uuid = "37a66f32-1e81-65fe-bf83-41449caa8f1c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							acrOptionType = "Hold Action",
							gVar = "ACR_TensorViper4_CD",
							holdActionDuration = 110,
							holdActionID = 846,
							uuid = "22a7de20-6cb6-7ba1-8b13-0b070fa537cd",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Event",
							eventCountdownTime = 5,
							uuid = "ec99b84e-4861-1f46-b1cd-c8bae0586108",
							version = 3,
						},
					},
				},
				enabled = false,
				eventType = 16,
				mechanicTime = 15.261765625,
				name = "Hold Pot",
				timelineIndex = 1,
				timerOffset = -15.300000190735,
				uuid = "0b6c426e-98e4-02cd-8582-5d280eeeac7c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							actionID = 34647,
							conditions = 
							{
								
								{
									"887106de-10f9-19a3-9cf4-a7387efd3020",
									true,
								},
							},
							uuid = "38863f72-0d97-6293-9f82-7ce8ee3fdcd0",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							jobValue = "VIPER",
							uuid = "887106de-10f9-19a3-9cf4-a7387efd3020",
							version = 3,
						},
					},
				},
				enabled = false,
				mechanicTime = 15.261765625,
				name = "[VPR] Force Ire",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = -10,
				timerStartOffset = -15,
				uuid = "15ea2933-097f-e5f1-85f0-7d5a236b57dc",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "41b5e6ff-dd0c-c14b-1d8a-35ad88043f8f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"145c4805-2605-d276-b3c5-118a7f881aa5",
									true,
								},
							},
							gVar = "ACR_TensorViper3_TrueNorth",
							gVarValue = 2,
							uuid = "c5964e60-281e-b083-b411-178ee6a43c71",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							jobValue = "VIPER",
							uuid = "145c4805-2605-d276-b3c5-118a7f881aa5",
							version = 3,
						},
					},
				},
				mechanicTime = 18.37640625,
				name = "[VPR] Disable True North",
				timelineIndex = 2,
				uuid = "4a3999ee-9795-af9a-bb14-5867bb91599c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"145c4805-2605-d276-b3c5-118a7f881aa5",
									true,
								},
							},
							gVar = "ACR_TensorViper3_TrueNorth",
							uuid = "c5964e60-281e-b083-b411-178ee6a43c71",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							jobValue = "VIPER",
							uuid = "145c4805-2605-d276-b3c5-118a7f881aa5",
							version = 3,
						},
					},
				},
				mechanicTime = 18.37640625,
				name = "[VPR] Enable True North",
				timelineIndex = 2,
				timerOffset = 10,
				uuid = "9d7bc8cc-7bcf-dc13-8dae-fe5ec34c3eed",
				version = 2,
			},
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "531b4b84-368b-c430-d8f5-de7a60a8b3d4",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "19410232-20bc-b93e-a438-62709ea40942",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "c2460665-33ba-71e9-11bb-6187fe203075",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "72506d12-80be-6b26-30d6-4f6cea891ee2",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "538474d3-7aa6-13b7-7ee1-40b90e61eda3",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "ae72a6fb-7224-0f5f-4ad6-daa1360a4c0b",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "87dd43f8-e937-da9c-f1a3-d9b67124ec48",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6b96a839-4450-4155-66cf-0d53fe545c09",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	}, 
	[10] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1c534092-ea61-a226-86b9-65084b78b122",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[11] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6c48d9e5-9d5d-a8e9-235a-6563a5d8cdb5",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[12] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "31e01778-52db-119c-f075-b1a2e1bc6488",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							gVar = "ACR_TensorViper4_Potion",
							holdActionDuration = 110,
							holdActionID = 846,
							uuid = "22a7de20-6cb6-7ba1-8b13-0b070fa537cd",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 62.553324919213,
				name = "Enable pot toggle",
				timelineIndex = 12,
				uuid = "7989b1a3-1cf6-1fcb-bd1b-6dc958e8b5cc",
				version = 2,
			},
		},
	},
	[15] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "f8333d51-a316-5d5d-9fb4-e84ff5fdd5e1",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[16] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "fd1e1f04-a02e-fb30-a1bb-aa3e92008114",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "2d2928b2-b630-363e-d613-0e34ec3e3382",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[17] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "ebb8ba7f-46af-f84b-9afa-d661fab7e7cf",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "7ef33787-0fdd-ecf3-8bc1-ef098befe3d7",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[18] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6fae197a-d98e-a45e-2514-8690480b7c8a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[19] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b44270ad-2edf-5e01-f49d-31abff55f23d",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[20] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "0d8e3041-157b-20b5-db3a-156bd4e14551",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "4e8577a9-c379-b9bd-bd1b-cad369e04b39",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[22] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "64c90c2f-edff-b7e3-cc33-c37dc866c27f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "d741daf7-2f5e-944b-99f7-eae515b48f87",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[23] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "590c18f4-515e-b788-0d87-67cad9cc2704",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "5110afa2-a93b-5ef6-2ec3-d100c3ea80b2",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[25] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "14ca8402-6c60-fcbe-32c8-3ebcf9014892",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "data.oldActionRange = _G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_ActionRangeAdjust\"]\n_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_ActionRangeAdjust\"] = 3\n\nself.used = true",
							conditions = 
							{
								
								{
									"1ed2031b-b71f-dc70-9311-289fe118e415",
									true,
								},
							},
							gVar = "ACR_TensorViper3_CD",
							uuid = "f9572b72-be34-fad9-a7c4-2c450e576f4b",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							dequeueIfLuaFalse = true,
							filterTargetType = "Tank",
							partyTargetType = "Melee DPS",
							uuid = "1ed2031b-b71f-dc70-9311-289fe118e415",
							version = 3,
						},
					},
				},
				mechanicTime = 118.07975730716,
				name = "[Melee Hacks] Increase Range",
				timelineIndex = 25,
				timerOffset = -1,
				uuid = "07629b27-09dc-1b62-8ad4-309a850faeb2",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_ActionRangeAdjust\"] = data.oldActionRange\ndata.oldActionRange = nil\n\nself.used = true",
							conditions = 
							{
								
								{
									"1ed2031b-b71f-dc70-9311-289fe118e415",
									true,
								},
							},
							gVar = "ACR_TensorViper3_CD",
							uuid = "f9572b72-be34-fad9-a7c4-2c450e576f4b",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							dequeueIfLuaFalse = true,
							filterTargetType = "Tank",
							partyTargetType = "Melee DPS",
							uuid = "1ed2031b-b71f-dc70-9311-289fe118e415",
							version = 3,
						},
					},
				},
				mechanicTime = 118.07975730716,
				name = "[Melee Hacks] Reset Range",
				timelineIndex = 25,
				timerOffset = 4,
				uuid = "5318aa19-b268-d94c-b227-50c06e5ff1b7",
				version = 2,
			},
		},
	},
	[26] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "05ae09c3-6a5a-3acf-0e97-1989da355053",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[29] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "4b468466-b7ad-cf8a-8167-a9c8650a1cb6",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[30] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "d2289143-7d4f-31a7-0f93-aeadecdf84f3",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "85c2ac64-7e30-7278-2d61-72f635ba20f4",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[32] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "25fcae84-caf2-b648-6884-317abdbe4d54",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"e6a49ef7-6507-ca1e-8100-cd4e8b085695",
									true,
								},
							},
							endIfUsed = true,
							gVar = "ACR_TensorViper3_Hotbar_Slither",
							uuid = "8c2b1092-6576-f35d-a2bf-ac97548616da",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							dequeueIfLuaFalse = true,
							jobValue = "VIPER",
							uuid = "e6a49ef7-6507-ca1e-8100-cd4e8b085695",
							version = 3,
						},
					},
				},
				mechanicTime = 162.3021905977,
				name = "[VPR] Dash In",
				timelineIndex = 32,
				timerOffset = -0.10000000149012,
				uuid = "d03f02dc-4a0c-c496-bdca-9305321eb0a1",
				version = 2,
			},
		},
	},
	[33] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "c00a8c31-b899-34e5-697f-13c7ea3c3841",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "e8805ad9-acd1-46ad-cdba-59efe546cfa9",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[34] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "4ef19558-496e-7a04-b662-90baae55a2e8",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "703ab006-250c-b1b2-b471-aeb08a480b16",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"145c4805-2605-d276-b3c5-118a7f881aa5",
									true,
								},
							},
							gVar = "ACR_TensorViper3_TrueNorth",
							gVarValue = 2,
							uuid = "c5964e60-281e-b083-b411-178ee6a43c71",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							jobValue = "VIPER",
							uuid = "145c4805-2605-d276-b3c5-118a7f881aa5",
							version = 3,
						},
					},
				},
				mechanicTime = 167.71168967762,
				name = "[VPR] Disable True North",
				timelineIndex = 34,
				timerOffset = -4,
				uuid = "81b9bc48-e119-525e-99dc-6a93a129dc5c",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"145c4805-2605-d276-b3c5-118a7f881aa5",
									true,
								},
							},
							gVar = "ACR_TensorViper3_TrueNorth",
							uuid = "c5964e60-281e-b083-b411-178ee6a43c71",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							jobValue = "VIPER",
							uuid = "145c4805-2605-d276-b3c5-118a7f881aa5",
							version = 3,
						},
					},
				},
				mechanicTime = 167.71168967762,
				name = "[VPR] Enable True North",
				timelineIndex = 34,
				timerOffset = 8,
				uuid = "eea77845-ad34-a526-9359-bc0e62b3e667",
				version = 2,
			},
		},
	},
	[35] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "fedfe4b3-3809-157f-b5d7-cdede25c11c3",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "93e1339b-76d6-c087-7f0b-f0150081246b",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[36] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "fb4be472-bf91-dd2e-dc72-1a40f1788c02",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[37] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "9dee7645-4483-9851-9f38-925befee6c95",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[38] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Cherry\\DMU\\Autosim\\Autosim",
				uuid = "4970679a-79cc-d296-09fd-33103d19be4a",
			},
			inheritanceRoot = "Cherry\\DMU\\Autosim\\Autosim",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "2ed9b8cc-73e7-4200-ef25-556ef6af38dc",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[39] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Cherry\\DMU\\Autosim\\Autosim",
				uuid = "e879bb3f-9629-ae9b-4779-119d9c78496f",
			},
			inheritanceRoot = "Cherry\\DMU\\Autosim\\Autosim",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "29f361e7-5b82-841b-2078-fa9108703cf7",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[VPR] Hold Vicewinder 1",
				uuid = "336c5ec0-ca03-2bc4-b18e-fa8be87d2f8e",
				version = 2,
			},
			inheritedObjectUUID = "06a02f4a-2fbc-cd04-b77b-af7d9e904cf1",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
		
		{
			data = 
			{
				name = "[VPR] Hold Vicewinder 2",
				uuid = "548e2bb2-18ab-266a-b22a-906b901c4e0d",
				version = 2,
			},
			inheritedObjectUUID = "fcb3535c-271b-1782-ab20-abc6af30e223",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
		
		{
			data = 
			{
				name = "[VPR] Hold Reawaken",
				uuid = "4edd3747-ad83-fa50-a86b-abc6c2b2c55f",
				version = 2,
			},
			inheritedObjectUUID = "6929710b-5db9-3d83-9949-5ec28e5b9795",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"145c4805-2605-d276-b3c5-118a7f881aa5",
									true,
								},
							},
							gVar = "ACR_TensorViper3_TrueNorth",
							gVarValue = 2,
							uuid = "c5964e60-281e-b083-b411-178ee6a43c71",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							jobValue = "VIPER",
							uuid = "145c4805-2605-d276-b3c5-118a7f881aa5",
							version = 3,
						},
					},
				},
				mechanicTime = 207.87965305988,
				name = "[VPR] Disable True North",
				timelineIndex = 39,
				timerOffset = -4,
				uuid = "c9da12e9-b963-5cb4-a4e4-7416ae2aef0a",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"145c4805-2605-d276-b3c5-118a7f881aa5",
									true,
								},
							},
							gVar = "ACR_TensorViper3_TrueNorth",
							uuid = "c5964e60-281e-b083-b411-178ee6a43c71",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							jobValue = "VIPER",
							uuid = "145c4805-2605-d276-b3c5-118a7f881aa5",
							version = 3,
						},
					},
				},
				mechanicTime = 207.87965305988,
				name = "[VPR] Enable True North",
				timelineIndex = 39,
				timerOffset = 8,
				uuid = "f3f39019-3da0-45f7-a157-be914438dfa7",
				version = 2,
			},
		},
	},
	[40] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "5ba2edb3-b119-672f-831b-99993f1f1ac3",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[41] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "abb49e58-a55c-73f4-eb1d-e6960b18abe8",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "52a3f306-48f4-38a2-474b-e26c6cb14e16",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[42] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "fab17f45-59de-8b41-ab9e-6a674cb17595",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[43] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "580eed72-f1f2-489e-b084-c14c4e3b9502",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[44] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "ecd4e6a7-61a3-556b-2dc3-da75506c75f7",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[45] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e285b564-1df7-f5e8-f187-aa5a927d29f4",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[47] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "c5adc90e-611a-df02-1bdb-04e0df12fe9e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[48] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "e620cea3-4643-419f-bfb1-28590fd0ce33",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[49] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "f6f30560-6651-8bdc-ea95-c88e150b6770",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[50] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "523fcb74-efe2-e410-b2ca-6d0a9f274984",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[51] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "59bc30a1-2676-050d-4f3a-ba57f97b9d31",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[53] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "169bf48f-e83b-5a7b-b1d4-108942465f5f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "2ec7e097-fb9b-14a3-7ab2-49f183963ea7",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[55] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "8cb7e575-4dc0-ec19-7e77-0c6bd75f8745",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[56] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "fab41bb6-bbb5-c05a-4c5a-8e00e9654b06",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[58] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "22564246-479c-3f72-1428-6854a2e3ef16",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[59] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "8cec1109-ea3e-d145-3b83-f40f3ae1a219",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "85eabf71-26ce-fb4d-238f-6b17e5a50fc1",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[60] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "342cc56d-7c79-6309-6d63-c2ff2736c2fd",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "a7db2295-9b65-0571-5624-050759887565",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[61] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "34b7883a-11e3-9446-7ec9-2784688a674a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[62] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1d8d89db-19e0-0cd7-79de-45d1363d14eb",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "71bed743-2f5f-cfbf-aa4f-c0b97cac5553",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[63] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "5ac711c0-a0aa-883c-f4ec-8aae99c858d0",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[64] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "f2f85461-d841-6365-998b-9afb1cac1771",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[65] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "abb66a76-7b69-b14a-b38b-1ff8ff044a46",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[66] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e7d40b47-491c-5eeb-edf3-e2650700c2d7",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[67] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "8341862c-aca7-a2d0-9dfe-49128dcb3e3c",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "915363fa-c1af-8d1e-aa3f-fac854c43a8a",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[70] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "53dea030-72ce-d82c-3dde-bf6a377519c0",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "be4cad3e-a6cd-a9fa-3ae3-b260b00faf8e",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[72] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"34a94a65-56b3-f33c-9a9e-8fa939a7f953",
									true,
								},
							},
							gVar = "ACR_TensorViper3_Hotbar_Slither",
							uuid = "e53490ae-861e-c609-a15f-8d55c7f62d39",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							jobValue = "VIPER",
							uuid = "34a94a65-56b3-f33c-9a9e-8fa939a7f953",
							version = 3,
						},
					},
				},
				enabled = false,
				mechanicTime = 370.25754620621,
				name = "[VPR] Dash In",
				timelineIndex = 72,
				timerOffset = 0.10000000149012,
				uuid = "6d95edb8-dbc9-162c-bdc4-81df547237ca",
				version = 2,
			},
		},
	},
	[73] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "56c6025d-9eed-a579-801a-e40b10dacd6d",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[74] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Cherry\\DMU\\Autosim\\Autosim",
				uuid = "9755968a-d937-0f26-663e-1bd05665dd3a",
			},
			inheritanceRoot = "Cherry\\DMU\\Autosim\\Autosim",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "de9ad92a-2ec8-9d8e-f159-15bc2814bbfa",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[76] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "216b80fc-f2bb-2730-3383-b8ea86660d8c",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[77] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Cherry\\DMU\\Autosim\\Autosim",
				uuid = "67961f15-42da-e1e1-9307-543772e34645",
			},
			inheritanceRoot = "Cherry\\DMU\\Autosim\\Autosim",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "510d4de9-23ba-176d-ad6d-3d778c0e5b79",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[78] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6e206aa8-9294-1dc4-9675-8c82b0edf538",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[79] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1ce53a83-8151-283f-94eb-6d1593c6b313",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "ff77362b-fe66-4a47-df55-e2dd809c493b",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_ArgusPositionalOldDraws\"] = true\n\nself.used = true",
							conditions = 
							{
								
								{
									"0c0eb382-2e93-1d96-a19a-1c8705d0aa62",
									true,
								},
							},
							gVar = "ACR_TensorViper3_CD",
							uuid = "b3a072a0-a923-8e7e-bef8-77de4f178ba5",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							dequeueIfLuaFalse = true,
							partyTargetType = "Melee DPS",
							uuid = "0c0eb382-2e93-1d96-a19a-1c8705d0aa62",
							version = 3,
						},
					},
				},
				mechanicTime = 450.00390950196,
				name = "[Melee] Enable Old Positional Draws",
				timelineIndex = 79,
				timerOffset = -1,
				uuid = "362697a5-8d0b-c3c0-af39-9aea477d942a",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "_G[\"ACR_\" .. gACRSelectedProfiles[TensorCore.mGetPlayer().job] .. \"_ArgusPositionalOldDraws\"] = false\n\nself.used = true",
							conditions = 
							{
								
								{
									"0c0eb382-2e93-1d96-a19a-1c8705d0aa62",
									true,
								},
							},
							gVar = "ACR_TensorViper3_CD",
							uuid = "b3a072a0-a923-8e7e-bef8-77de4f178ba5",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							dequeueIfLuaFalse = true,
							partyTargetType = "Melee DPS",
							uuid = "0c0eb382-2e93-1d96-a19a-1c8705d0aa62",
							version = 3,
						},
					},
				},
				mechanicTime = 450.00390950196,
				name = "[Melee] Disable Old Positional Draws",
				timelineIndex = 79,
				timerOffset = 5,
				uuid = "3cbb75e2-c20a-eb20-a13e-6f743d4a2abe",
				version = 2,
			},
		},
	},
	[80] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "8ef5b17f-460d-06a3-129a-d6ed9df4decf",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"78456bc8-40c1-8953-8318-01d15b40af4a",
									true,
								},
								
								{
									"e207561c-14ec-c357-91b7-696dec0aba4a",
									true,
								},
							},
							gVar = "ACR_TensorViper4_Hotbar_Potion",
							uuid = "704988cd-ad00-1bdd-b1a4-8e3e2e314194",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							jobValue = "VIPER",
							uuid = "78456bc8-40c1-8953-8318-01d15b40af4a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Event",
							eventArgType = 2,
							eventSpellID = 34626,
							uuid = "e207561c-14ec-c357-91b7-696dec0aba4a",
							version = 3,
						},
					},
				},
				enabled = false,
				eventType = 2,
				mechanicTime = 469.19930950196,
				name = "[VPR] Hotbar Pot",
				timeRange = true,
				timelineIndex = 80,
				timerEndOffset = 10,
				timerOffset = -6,
				timerStartOffset = -10,
				uuid = "dd975e21-8eac-9a87-b608-5aa19397dfc4",
				version = 2,
			},
		},
	},
	[83] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "167e792e-2234-37e2-3935-23409ffba0be",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[84] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "dff18a7b-0914-ac97-ac92-64e1ebd3204b",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[86] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "0f85d0e5-02cf-94a1-c642-1cc74915c4b5",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[89] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6acb816c-662d-b4d0-b278-0ad2db7e2b7c",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[91] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6f663b9d-47e1-5611-d8cd-aecb342d6fad",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "76a8e8c5-6f4b-41f9-d194-7473162257d5",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[93] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "a1acd28b-3ad7-3a3f-3534-13dd8f1d281b",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "b43cf033-c338-d047-3f1f-330557bbc983",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Misc",
							conditions = 
							{
								
								{
									"52f2e2e2-6456-0352-a47e-303ec10ec2b2",
									true,
								},
							},
							gVar = "ACR_TensorViper3_CD",
							setTarget = true,
							targetContentID = 6052,
							targetType = "ContentID",
							uuid = "d8d6f3fc-7f0d-e484-b40a-071dfbbf6940",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							partyTargetType = "Melee DPS",
							uuid = "52f2e2e2-6456-0352-a47e-303ec10ec2b2",
							version = 3,
						},
					},
				},
				mechanicTime = 511.44225832111,
				name = "[Melee] Target Exdeath",
				timelineIndex = 93,
				uuid = "8c2ca94d-3f8c-41c5-951b-806fce445cc0",
				version = 2,
			},
		},
	},
	[94] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "ee837b66-7d1d-5d52-e4f8-c81c084713b6",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[95] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Misc",
							conditions = 
							{
								
								{
									"52f2e2e2-6456-0352-a47e-303ec10ec2b2",
									true,
								},
							},
							gVar = "ACR_TensorViper3_CD",
							setTarget = true,
							targetContentID = 7691,
							targetType = "ContentID",
							uuid = "d8d6f3fc-7f0d-e484-b40a-071dfbbf6940",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 9,
							partyTargetType = "Melee DPS",
							uuid = "52f2e2e2-6456-0352-a47e-303ec10ec2b2",
							version = 3,
						},
					},
				},
				mechanicTime = 514.44485832111,
				name = "[Melee] Target Chaos",
				timelineIndex = 95,
				timerOffset = 0.5,
				uuid = "167da5c1-5450-a28a-a96e-d8004acf73dc",
				version = 2,
			},
		},
	},
	[98] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "b8077b02-54c9-ce76-4c8e-7c289c3e3f92",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[101] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "86e333c9-9344-5cf5-9311-6083ec350899",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[Lj Draw] Limit Cut",
				uuid = "bf97399f-99b0-a2d7-81cb-20bb2a4704c5",
				version = 2,
			},
			inheritedObjectUUID = "f52ad783-1c20-fac5-a88d-4e3011155f67",
			inheritedOverwrites = 
			{
				actions = 
				{
					
					{
						type = "add",
						value = 
						{
							data = 
							{
								name = "ArgusDraws+",
								uuid = "c4202741-ef02-455f-b057-5e184f5f1f8e",
								version = 2.1,
							},
							inheritedObjectUUID = "d97edc60-87a7-17b0-9d09-9d6a5960cd72",
							inheritedOverwrites = 
							{
								actionLua = "-- Green is safe from the OTHER numbered beams; your own bait still hits you.\n-- Fixed firing origins are predicted from the opening dash order. Hidden\n-- Kefkas need not have moved to those origins yet, so do not attach to them.\nlocal sources = data.ljUltimaBlasterSources\nlocal targets = data.ljUltimaBlasterTargets\nlocal channel = Argus2.getNextUnusedChannel(true)\nif channel == nil then\n    self.used = true\n    return\nend\n\nlocal state = { lines = {}, bySource = {}, remaining = 8, active = true }\ndata.ljLimitCutDraw = state\nfunction state.clear(draw)\n    if draw.base then\n        Argus.deleteTimedShape(draw.base)\n        draw.base = nil\n    end\n    for _, line in ipairs(draw.lines) do\n        if line.uuid then\n            Argus.deleteTimedShape(line.uuid)\n            line.uuid = nil\n        end\n    end\n    draw.active = false\nend\n\n-- Use one fixed plane just above the decorative floor. Terrain projection\n-- can change as scene models appear/disappear; keep it out of this draw.\n-- UI rendering remains behind characters, without a player cutout.\nlocal drawHeight = 0.15\nlocal surfaceFlags = Argus2.RenderFlags.FLAG_RENDER_UI\nlocal baseFlags = surfaceFlags | Argus2.RenderFlags.FLAG_OCCLUSION_BASE\nlocal dangerFlags = surfaceFlags | Argus2.RenderFlags.FLAG_OCCLUDE\nlocal safeDrawer = TensorCore.getCachedFlatDrawer(\n    0x6600FF00, 0x6600FF00, 0x6600FF00, 0xCC66FF66, 1.5, channel, baseFlags)\n\nlocal first = sources[1].position\nlocal second = sources[2].position\nlocal firstAngle = math.atan2(first.x - 100, first.z - 100)\nlocal delta = math.atan2(second.x - 100, second.z - 100) - firstAngle\nlocal step = math.atan2(math.sin(delta), math.cos(delta))\nlocal dx, dz = first.x - 100, first.z - 100\nlocal radius = math.sqrt(dx * dx + dz * dz)\n\nfor order = 1, 8 do\n    local angle = firstAngle - step * (order - 1)\n    local line = {\n        position = { x = 100 + math.sin(angle) * radius,\n                     y = drawHeight, z = 100 + math.cos(angle) * radius },\n        targetId = targets[order],\n        resolved = false,\n    }\n    state.lines[order] = line\n    state.bySource[sources[order].entityId] = line\n    if order ~= data.ljUltimaBlasterPlayerNumber then\n        local target = TensorCore.mGetEntity(line.targetId)\n        if not target then\n            state.clear(state)\n            self.used = true\n            return\n        end\n        -- ShapeDrawer has no fixed-world-origin + target-attachment overload.\n        -- Let Argus resolve the moving target every render frame; never re-aim\n        -- this shape on the slower TensorReactions update pulse.\n        line.uuid = Argus2.addTimedRectFilled(\n            10000, line.position.x, drawHeight, line.position.z,\n            100, 6, TensorCore.getHeadingToTarget(line.position, target.pos),\n            0x00000000, 0x00000000, 0x00000000,\n            0,              -- delay\n            nil,            -- fixed world source; no source entity attachment\n            line.targetId,  -- native target tracking\n            true,           -- keep the full beam length\n            0x00000000, 0, 0, 0, 0, -- invisible, flat blocker\n            false,          -- oldDraw\n            false,          -- doNotDetect: retain safe-jump detection\n            0, false,       -- no heading offset; allow native target aiming\n            dangerFlags, channel)\n        if not line.uuid then\n            state.clear(state)\n            self.used = true\n            return\n        end\n    end\nend\n\n-- These are fail-safe lifetimes, not hit predictions. Remove the safe base\n-- before any blocker can expire if a cast event is missed.\nstate.expiresAt = Now() + 9000\nstate.base = safeDrawer:addTimedCircle(\n    9000, 100, drawHeight, 100, 20, 0, false, true, baseFlags)\nif not state.base then state.clear(state) end\nself.used = true\n",
							},
						},
					},
				},
			},
		},
	},
	[102] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "11b35b54-326f-ec60-5fac-1d7afa671e24",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[103] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "390ee70f-342a-ef7b-a440-74ad22db671f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[104] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "9b93c662-01b2-ce16-b78c-8e6cabec7832",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "de0cb898-accc-64ec-1235-0c3a95142528",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[105] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "af2ad7f5-99b0-8119-9871-a08785a47e05",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[107] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "bf6c9523-c233-51e7-0597-7fb94f07a073",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "8da20e8b-fae4-becf-73c2-afa1971ba05b",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[108] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "44c934c6-938b-d472-21de-1b78e14d04d6",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "be6e33dc-d072-d568-e308-916684eeb1ac",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[112] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "e7c950cd-8b36-c7a9-8ec0-ee93d921401d",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[113] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "7a81dff2-3de1-dd9e-9367-821025c5cfc2",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "4c9f63e8-63ae-4554-7a16-5d5eb6cacf38",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[115] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "04f8a7e4-69e7-8ae8-10a1-58866d7313b4",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[118] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1b20fafb-c402-24f7-b928-c9b596b0704b",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "bc956a23-8b11-089f-bb43-dcbded4c14f3",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[122] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "5012a32a-e733-5176-34ae-e7a4256453fa",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "3cf1c720-49ec-c28c-ac9c-5a12ddae3ef0",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[126] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "c08439a6-7034-6f3a-f536-bc983e124f36",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[129] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "3f582d03-cd40-bd3f-20cd-bd59b33d82d3",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[131] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "572a7aba-5dd3-2946-44b9-07282113af0a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "b3b57cb0-4241-a55c-680d-3f566b520940",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[135] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "ce295cf6-c759-464a-a7ba-dd34d6598f06",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "c619510c-b1db-1080-4373-d3e2c473211c",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[136] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "ccfe27ef-4033-0a53-a0a7-1be95a09b27f",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[137] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "67c7ff7a-067d-541e-5ea4-659410740f4a",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[138] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "d949b525-9539-17a1-d0f8-39cb7ee10035",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "9df7abed-0ab6-a549-dcc2-0d73cbcde43d",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[140] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "a983c8c8-5e1c-d0fc-610a-90e2fa808b18",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[141] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "8b62592d-c8a0-9711-7a45-7f375cf0917d",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[143] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "98cf68fb-4c65-535f-be3d-d8e9aa15e10b",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[146] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1f911184-ec1e-9030-034a-90422ece32d4",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[147] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "0e2bacff-929f-8d4b-db78-b0d55629be8f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[148] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Cherry\\DMU\\Autosim\\Autosim",
				uuid = "6adb6d2e-247d-8eaa-5854-899c5a784e5e",
			},
			inheritanceRoot = "Cherry\\DMU\\Autosim\\Autosim",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "92210bfa-257e-395e-8060-4a1ccb6a294a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[150] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "36d23027-b5cd-79db-18a3-8591e1786f77",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[151] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "e8d8199a-55ff-a78e-4eb2-4c245c8a9eea",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[152] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6ca81359-cc6c-b56d-0b99-69bff63121a9",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[153] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "676f2456-ccf7-783a-1cdc-5f4400fcbee6",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "86119c2c-19f2-3130-11da-4af21a5ffbbc",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[154] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "9aa367bb-8013-fb47-30ac-5625b426160b",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "a037e8e3-333a-dc6f-a9e1-76ed96dde6b3",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[155] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6ff30ba0-1b81-762c-4ddf-8cd2915090f0",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[156] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "9b55ee4d-47a0-4379-30ee-3e9381df7f1d",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "62a7a835-2fa9-a461-cc39-57bb5949df45",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[157] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "f0f90e1a-43f6-5a76-4e15-80b871e9f16a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "8ec06e50-2c56-058c-8942-5ba663ea9860",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[158] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Cherry\\DMU\\Autosim\\Autosim",
				uuid = "cc835b6d-fe90-1a59-de14-ca236e3b5b1d",
			},
			inheritanceRoot = "Cherry\\DMU\\Autosim\\Autosim",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "a8fd869f-4f58-9b13-2935-e6f91a7f46af",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[159] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "80893da4-6c7f-dd38-258b-fdf60ec25374",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[161] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "d34e99a4-0df7-c368-05cb-b7a2222483d4",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[162] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "fc714a04-0fc0-7d48-dd12-82368cc52a14",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[163] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "bef4f659-f19f-0dad-998b-d98bcec7e069",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[164] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "716487d8-955e-0f04-cdf0-b3feadae34a8",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "46af4b86-69da-78b2-349e-31f4962e03d6",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[165] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "2152d733-83f8-aa7f-d391-c4215c730483",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "6a55cf1b-bba4-8787-92cc-fec9f25fa42b",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[166] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1dbed6f2-0b81-722e-6915-fc54c902c6c2",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[167] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "05600dcd-0fd0-4339-1126-4717f6b7fd1d",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[168] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "514cab4c-bfd6-d700-05b1-f2ca4618809c",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[169] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "4c665467-a772-191b-c45e-4e7dd786b9b7",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[170] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "24fa1329-0847-80bd-3e0d-649f87e6e3f9",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[171] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Cherry\\DMU\\Autosim\\Autosim",
				uuid = "1854d36e-2271-65ea-cc83-327045d2a79e",
			},
			inheritanceRoot = "Cherry\\DMU\\Autosim\\Autosim",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "c814e01e-070a-9922-09ff-34dcad0816ee",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[172] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "873bfeaf-39ef-4ce3-3078-eb29d151a03f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[173] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "27854b22-ee09-25f6-09d5-f43c22645272",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[177] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "f41a8d68-4d92-6914-ac31-baea13cdb738",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[179] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "6db976e6-039d-648a-490a-1cf4eb443476",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[180] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "716653f6-09cd-7d02-c8c7-28d879968606",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "e3b00e0c-f052-ba78-5299-1686e209de1c",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[185] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "9be67b15-6da0-0aa9-ecca-0a27b57f0f25",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[186] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "2076fb40-4e0f-11f4-e2c0-538efc5caf90",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[188] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "605f3e24-82cd-77e0-36e4-dc6e1cb0b134",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[191] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "82ca3a50-69fb-8cfc-8ea0-17828d0de320",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[192] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1038a47d-4a63-6ec9-7f83-9d43b870c5cd",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[193] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "518c48ca-2f0b-b506-4b7d-2e680e13e59a",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[202] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "542dd2f1-c1f4-631d-1513-2e2b37b4af01",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[203] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "b63cabdc-9f9d-f238-b8e1-8dd6d86f242c",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[208] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "869c4f0f-5339-194b-d65b-ea5d0ef41e9f",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[209] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "5f40c354-acb8-1c30-ad35-98aae67fd5a4",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				name = "[Draw] P5 Exaflares",
				uuid = "0ea5a747-c5cd-0ee6-9ede-869a8e3445ed",
				version = 2,
			},
			inheritedObjectUUID = "dd6428d9-a7b5-42eb-9c77-49c655a81657",
			inheritedOverwrites = 
			{
				enabled = false,
			},
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "ee0a43c2-7c71-813e-7c19-23a010a6d412",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[210] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "e00fefc2-203b-ffce-9e34-0818a4bccb12",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "84d62f38-874d-5744-a440-f8c6fbe150c8",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[212] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "46a2a6d6-a5f9-8492-d55e-6c281c2d08e6",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[216] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "27bd33b4-7777-9c18-46f8-6bce8587a984",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
	},
	[218] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "09da3ca0-6dc1-d4ac-9d66-baae0648aef0",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[219] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "28e23385-cd07-5f81-df5f-45638a9c6655",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[221] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "1dfd76ce-dd9c-580a-8fee-54e02e0b781e",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "6c859444-5425-2c40-7771-b36e4fcf18d4",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[223] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "8b31c192-7373-87de-1aea-989079e2d322",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[225] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "store\\anyone\\dmu\\main",
				uuid = "66369832-92e2-3806-2498-114c9d340e82",
			},
			inheritanceRoot = "store\\anyone\\dmu\\main",
			objectType = "folder",
		},
		
		{
			data = 
			{
				displayPath = "",
				name = "Lj\\umad\\draws_na",
				uuid = "631f8528-ad46-441c-e6bd-74dafa0a4af8",
			},
			inheritanceRoot = "Lj\\umad\\draws_na",
			objectType = "folder",
		},
	},
	[227] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "Cherry\\DMU\\Autosim\\Autosim",
				uuid = "bd99add0-b5c7-aa2c-c27a-895abaaade40",
			},
			inheritanceRoot = "Cherry\\DMU\\Autosim\\Autosim",
			objectType = "folder",
		},
	},
	inheritedProfiles = 
	{
		"store\\anyone\\dmu\\main",
		"Lj\\umad\\draws_na",
		"Cherry\\DMU\\Autosim\\Autosim",
	},
	timelineName = "dmu",
	version = "1.5.5",
}



return tbl