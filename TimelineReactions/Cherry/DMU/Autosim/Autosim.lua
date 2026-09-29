local tbl = 
{
	
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local acr = TensorCore.API.TensorACR\n\n-- AoE target-count phase types. P3 cleave windows set these to 2.\nlocal aoeTypes = {\n    \"SelfCircle5Yd\", \"SelfCircle8Yd\", \"Cone8Yd\", \"Line10Yd\", \"Line15Yd\",\n    \"TargetCircle5YdRange3Yd\", \"TargetCircle5YdRange5Yd\",\n    \"TargetCircle5YdRange20Yd\", \"TargetCircle5YdRange25Yd\",\n}\n\nacr.clearAutoSimPhases(\"FullDowntime\")\nd(\"FullDowntime cleared\")\nacr.clearAutoSimPhases(\"MeleeDowntime\")\nd(\"MeleeDowntime cleared\")\nacr.clearAutoSimPhases(\"Stun\")\nd(\"Stun cleared\")\nacr.clearAutoSimPhases(\"RaidBuff\")\nd(\"RaidBuff cleared\")\nacr.clearAutoSimPhases(\"BossModifier\")\nd(\"BossModifier cleared\")\nfor i = 1, #aoeTypes do\n    acr.clearAutoSimPhases(aoeTypes[i])\nend\nd(\"AoE phases cleared\")\n\nacr.clearAutoSimUncertainty() --If this isn't done, errors are thrown\nd(\"Uncertainty cleared\")\n--acr.clearAutoSimPhases(\"CasterDowntime\")\n--acr.clearAutoSimPhases(\"TargetLifetime\", 0)\n--acr.clearAutoSimPhases(\"DotAvailability\", 0)\n\nacr.setAutoSimKillTime(1116)       -- measured: 1116.11 and 1116.25 on two clears\nd(\"set Autosim kill time\")\nacr.addAutoSimUncertainty(690, 6)  -- the P3 push shifts everything after it\nd(\"set uncertainty\")\n\n-- { phaseType, startTime, endTime, value, targetSlot }\nlocal phases = {\n    -- Nothing is targetable.\n    { \"FullDowntime\", 197.5, 207.9 },   -- Kefka untargetable, P1 -> P2\n\n    -- P2 -> P3. Kefka leaves at 381.5 but players can still act until Kefka's\n    -- stun (774) lands at ~387.8; casting resumes ~420.3, bosses at 427.5.\n    { \"FullDowntime\", 381.5, 387.9 },\n    { \"Stun\",         387.9, 420.3 },\n    { \"FullDowntime\", 420.3, 427.5 },\n\n    -- The player cannot act.\n    -- Idyllic Will (cast 173.4): Graven Image puts sleep (4894) on half the\n    { \"Stun\", 174.3, 180.3 },\n\n    -- Raid buffs, the whole fight. Two-minute party cooldowns on the COMBAT\n    -- clock, so they deliberately do NOT take the P4 timeline offset: they come\n    -- back on schedule no matter how the boss timeline shifted.\n    { \"RaidBuff\",    1.560,   21.115, 1.3 },\n    { \"RaidBuff\",  122.595,  142.506, 1.3 },\n    { \"RaidBuff\",  243.152,  262.214, 1.3 },\n    { \"RaidBuff\",  363.497,  382.736, 1.3 },\n    { \"RaidBuff\",  484.703,  502.520, 1.3 },\n    { \"RaidBuff\",  604.734,  623.706, 1.3 },\n    { \"RaidBuff\",  725.768,  745.411, 1.3 },\n    { \"RaidBuff\",  845.888,  865.798, 1.3 },\n    { \"RaidBuff\",  968.340,  987.002, 1.3 },\n    { \"RaidBuff\", 1088.214, 1102.669, 1.3 },\n\t\n\t-- Boss Modifier\n\t-- Independently tracked on this so we can keep our Raid Buffs.\n\t{ \"BossModifier\", 322.4, 381.5, 0.8 },\n\n    -- Higanbana. Lifetime and availability track each other: a target you cannot\n    -- reach is not worth planning a DoT into. Kefka through 381.5, then\n    -- Chaos/Exdeath from 427.5 until Exdeath dies ~729.\n    --[[{ \"TargetLifetime\",    0.0, 197.5, 1, 0 },\n    { \"TargetLifetime\",  207.9, 381.5, 1, 0 },\n    { \"TargetLifetime\",  427.5, 729.0, 1, 0 },\n    { \"DotAvailability\",   0.0, 197.5, 1, 0 },\n    { \"DotAvailability\", 207.9, 381.5, 1, 0 },\n    { \"DotAvailability\", 427.5, 729.0, 1, 0 },\n\t]]--\n}\n\nfor i = 1, #phases do\n    local p = phases[i]\n    acr.addAutoSimPhase(p[1], p[2], p[3], p[4], p[5])\n\td(p[1] .. \" added\")\nend\n\n-- P1 from the first Tele-trouncing cast (151.5) to Kefka leaving (197.5).\n-- The ID is kept so [AutoSim] P1 Low HP can lower this same phase in place\n-- once Kefka is low; a second BossModifier over the same window would overlap.\ndata.Cherry_AutoSimP1ModID = acr.addAutoSimPhase(\"BossModifier\", 151.5, 197.5, 0.8)\nd(\"P1 BossModifier added, id \" .. tostring(data.Cherry_AutoSimP1ModID))\n\n-- P3 padding up to limit cut (Ultima Blaster, 521.4): Chaos and Exdeath stacked\n-- within 6y (>=80% of 42 P3 clears, measured 2026-09-28), so AoE hits both.\n-- Only outside the Fated/Fabled Hero window: Anyone disables AOE at 430.6 when\n-- the hero buffs lock each player to one boss and re-enables it at 469.2, so\n-- the 437-457 stack does not count.\nlocal cleaveWindows = {\n    { 486, 513 },\n}\n\nfor i = 1, #cleaveWindows do\n    local w = cleaveWindows[i]\n    for j = 1, #aoeTypes do\n        acr.addAutoSimPhase(aoeTypes[j], w[1], w[2], 2)\n    end\nend\nd(\"P3 cleave windows added\")\n\nd(\"Autosim Opti added\")\n\nself.used = true\n",
							uuid = "a26aaf06-e23a-f2b6-bd46-631cfdfa5694",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				eventType = 16,
				mechanicTime = 15.261765625,
				name = "[AutoSim] Start",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 5,
				timerStartOffset = -46,
				uuid = "42382074-44ad-92ee-bf3a-657f792ecc71",
				version = 2,
			},
			inheritedIndex = 1,
		},
	}, 
	[38] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local acr = TensorCore.API.TensorACR\nlocal now = acr.getAutoSimTime()\nlocal id = data.Cherry_AutoSimP1ModID\n\n-- Lower the Tele-trouncing BossModifier that [AutoSim] Start added, in place,\n-- rather than adding a second phase over the same window.\nif id and now < 197.5 then\n    acr.setAutoSimPhase(id, now, 197.5, 0.6)\nend\n\nself.used = true\n",
							conditions = 
							{
								
								{
									"9db718a9-5233-7dcc-917d-d82ce3827dd6",
									true,
								},
							},
							name = "BossModifier 0.8 -> 0.6 until 197.5",
							uuid = "abf95601-c3f8-63e2-998a-d345cffce0a8",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Filter",
							conditions = 
							{
								
								{
									"5755a9b6-e9e6-4df6-a21a-3f40399f69f7",
									true,
								},
							},
							filterTargetType = "Enemy",
							name = "Nearest enemy",
							uuid = "9db718a9-5233-7dcc-917d-d82ce3827dd6",
							version = 3,
						},
						inheritedIndex = 1,
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 2,
							hpValue = 16,
							partyTargetName = "Kefka",
							partyTargetSubType = "Lowest HP",
							partyTargetType = "Detection Target",
							uuid = "5755a9b6-e9e6-4df6-a21a-3f40399f69f7",
							version = 3,
						},
					},
				},
				mechanicTime = 197.52218784626,
				name = "[AutoSim] P1 Low HP",
				timeRange = true,
				timelineIndex = 38,
				timerEndOffset = -1,
				timerStartOffset = -25,
				uuid = "70440511-cefe-fb78-a69a-094d5f8d15c6",
				version = 2,
			},
			inheritedIndex = 1,
		},
	},
	[39] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "AutoSim",
				uuid = "2e876c3b-f721-a139-878c-ee54e1640462",
			},
			objectType = "folder",
		},
	},
	[74] = 
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
							acrOptionType = "Hold Action",
							conditions = 
							{
								
								{
									"ed3c6767-5791-17f5-955b-1333f3632039",
									true,
								},
							},
							gVar = "ACR_TensorViper4_CD",
							holdActionDuration = 12,
							holdActionID = 34626,
							uuid = "630f2a06-5da7-f94d-9742-35d1541a47b0",
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
							uuid = "ed3c6767-5791-17f5-955b-1333f3632039",
							version = 3,
						},
					},
				},
				mechanicTime = 381.48132335556,
				name = "[Autosim] VPR Hold Reawaken",
				timelineIndex = 74,
				timerOffset = -10,
				uuid = "9163b670-2875-23f1-801b-e45ee5bd12f4",
				version = 2,
			},
		},
	},
	[77] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "AutoSim",
				uuid = "0c3a633e-9412-174a-87ca-6e041e559ad6",
			},
			objectType = "folder",
		},
	},
	[148] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "-- Fires when Exdeath goes untargetable (dies) at the end of P3, ~4.45s before\n-- Kefka appears, so AutoSim can plan the whole P4/P5 schedule ahead of time.\n-- The timeline window (711.9 - 803.9) keeps out the brief mid-P3 untargetable.\nif eventArgs.entityContentID ~= 6052 or eventArgs.isTargetable then\n    return\nend\n\nlocal acr = TensorCore.API.TensorACR\n\n-- The timeline has NOT resynced yet here (it jumps to 801.9 when Kefka appears),\n-- so anchor on the combat clock: Kefka is targetable 4.45s from now (measured\n-- 4.28-4.55 over 26 pulls). Timeline times below + offset = AutoSim time.\nlocal KEFKA_DELAY = 4.45\nlocal now    = acr.getAutoSimTime()\nlocal offset = now + KEFKA_DELAY - 801.9\n\nd(\"AutoSimTime: \" .. now)\nd(\"Offset: \" .. offset)\n\nacr.setAutoSimKillTime(1116)   -- already combat time, so no offset. Measured\n                               -- 1116.11 and 1116.25 on two clears.\nacr.clearAutoSimUncertainty()\n\n-- Replace the pre-P4 schedule. Clearing first also makes this safe to re-run.\nacr.clearAutoSimPhases(\"FullDowntime\")\nacr.clearAutoSimPhases(\"MeleeDowntime\")\nacr.clearAutoSimPhases(\"CasterDowntime\")\nacr.clearAutoSimPhases(\"TargetLifetime\", 0)\nacr.clearAutoSimPhases(\"DotAvailability\", 0)\n-- Ends the Exdeath-solo 0.6x from [AutoSim] Exdeath Solo 0.6x. The only other\n-- BossModifier (322.4-381.5) is long over by now.\nacr.clearAutoSimPhases(\"BossModifier\")\n\n-- { phaseType, startTime, endTime, value, targetSlot }, timeline times + offset.\nlocal phases = {\n    -- Nothing is targetable.\n    { \"FullDowntime\",  now,            801.9 + offset },  -- Exdeath dead until Kefka appears\n    { \"FullDowntime\",  934.7 + offset,  965.7 + offset },  -- Kefka untargetable, P4 -> P5\n\n    --[[ Higanbana. Kefka is one entity from the P4 start to the kill.\n    { \"TargetLifetime\",   801.9 + offset, 1185.3 + offset, 1, 0 },\n    { \"DotAvailability\",  801.9 + offset,  934.7 + offset, 1, 0 },\n    { \"DotAvailability\",  965.7 + offset, 1185.3 + offset, 1, 0 },\n\t]]--\n}\n\nfor i = 1, #phases do\n    local p = phases[i]\n    acr.addAutoSimPhase(p[1], p[2], p[3], p[4], p[5])\nend\n\nself.used = true\n",
							name = "Add P4 and P5 phases",
							uuid = "300b0b60-34cb-4af4-b808-1bd5d64054d9",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				eventType = 26,
				mechanicTime = 715.37264047081,
				name = "[AutoSim] P4 Start",
				timeRange = true,
				timelineIndex = 148,
				timerEndOffset = 88.5,
				timerStartOffset = -3.5,
				uuid = "075c79d2-21ae-d807-8cda-eb85a2e89bad",
				version = 2,
			},
			inheritedIndex = 1,
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
							actionLua = "-- Once Chaos is below 0.1% HP he is as good as dead, and Exdeath dies a few\n-- seconds later (Chaos untargetable -> Exdeath untargetable is 2-11s over 43\n-- pulls, depends on DPS). Don't dump resources into that tail: 0.6x until\n-- Exdeath dies. [AutoSim] P4 Start clears BossModifier when Exdeath goes\n-- untargetable, so the 15s end is only a fallback cap.\nlocal function first(cid)\n    local el = EntityList(\"contentid=\" .. cid)\n    if el then\n        for _, e in pairs(el) do return e end\n    end\nend\n\nlocal chaos   = first(7691)\nlocal exdeath = first(6052)\nif not chaos or not exdeath or not exdeath.targetable then\n    return   -- Exdeath already gone: P4 Start owns the schedule now\nend\nif chaos.hp.percent >= 0.1 then\n    return\nend\n\nlocal acr = TensorCore.API.TensorACR\nlocal now = acr.getAutoSimTime()\n\nacr.addAutoSimPhase(\"BossModifier\", now, now + 15, 0.6)\nd(\"Exdeath solo 0.6x BossModifier from \" .. now)\n\nself.used = true\n",
							name = "0.6x BossModifier once Chaos < 0.1%",
							uuid = "a3c334ea-4da0-0ea2-94b7-20432e2d429f",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 715.37264047081,
				name = "[AutoSim] Exdeath Solo 0.6x",
				timeRange = true,
				timelineIndex = 148,
				timerEndOffset = 88.5,
				timerStartOffset = -3.5,
				uuid = "693d30e4-718d-bdb1-8ee6-ab336ce5e682",
				version = 2,
			},
		},
	},
	[171] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "AutoSim",
				uuid = "2d3a7ef9-af9b-5792-9632-f1e3eb401c99",
			},
			objectType = "folder",
		},
	},
	inheritedProfiles = 
	{
	},
	timelineName = "dmu",
	version = "1.5.5",
}



return tbl