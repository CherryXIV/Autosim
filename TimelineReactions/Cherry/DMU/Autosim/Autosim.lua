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
							actionLua = "local acr = TensorCore.API.TensorACR\n\n-- AoE target-count phase types. P3 cleave windows set these to 2.\n--[[\nlocal aoeTypes = {\n    \"SelfCircle5Yd\", \"SelfCircle8Yd\", \"Cone8Yd\", \"Line10Yd\", \"Line15Yd\",\n    \"TargetCircle5YdRange3Yd\", \"TargetCircle5YdRange5Yd\",\n    \"TargetCircle5YdRange20Yd\", \"TargetCircle5YdRange25Yd\",\n}\n]]--\n\nlocal aoeTypes = {\n    \"SelfCircle5Yd\", \"TargetCircle5YdRange20Yd\"\n}\n\nacr.clearAutoSimPhases(\"FullDowntime\")\nd(\"FullDowntime cleared\")\nacr.clearAutoSimPhases(\"MeleeDowntime\")\nd(\"MeleeDowntime cleared\")\nacr.clearAutoSimPhases(\"Stun\")\nd(\"Stun cleared\")\nacr.clearAutoSimPhases(\"RaidBuff\")\nd(\"RaidBuff cleared\")\nacr.clearAutoSimPhases(\"BossModifier\")\nd(\"BossModifier cleared\")\nfor i = 1, #aoeTypes do\n    acr.clearAutoSimPhases(aoeTypes[i])\nend\nd(\"AoE phases cleared\")\n\nacr.clearAutoSimUncertainty() --If this isn't done, errors are thrown\nd(\"Uncertainty cleared\")\n--acr.clearAutoSimPhases(\"CasterDowntime\")\n--acr.clearAutoSimPhases(\"TargetLifetime\", 0)\n--acr.clearAutoSimPhases(\"DotAvailability\", 0)\n\nacr.setAutoSimKillTime(1116)       -- measured: 1116.11 and 1116.25 on two clears\nd(\"set Autosim kill time\")\nacr.addAutoSimUncertainty(727, 3)  -- the P3 push: Exdeath untargetable, mean 727.05 over 42 pulls\nd(\"set uncertainty\")\n\n-- { phaseType, startTime, endTime, value, targetSlot }\nlocal phases = {\n    -- Nothing is targetable.\n    { \"FullDowntime\", 197.5, 207.9 },   -- Kefka untargetable, P1 -> P2\n\n    -- P2 -> P3. Kefka leaves at 381.5 but players can still act until Kefka's\n    -- stun (774) lands at ~387.8; casting resumes ~420.3, bosses at 427.5.\n    { \"FullDowntime\", 380.5, 427.5 },\n    { \"Stun\",         387.9, 420.3 },\n\n    -- The player cannot act.\n    -- Idyllic Will (cast 173.4): Graven Image puts sleep (4894) on half the\n    { \"Stun\", 174.3, 180.3 },\n\n    -- Raid buffs, the whole fight. Two-minute party cooldowns on the COMBAT\n    -- clock, so they deliberately do NOT take the P4 timeline offset: they come\n    -- back on schedule no matter how the boss timeline shifted.\n    { \"RaidBuff\",    1.0,   21.115, 1.3 },\n    { \"RaidBuff\",  122.595,  142.506, 1.3 },\n    { \"RaidBuff\",  243.152,  262.214, 1.3 },\n    { \"RaidBuff\",  358,  381, 1.2 },\n    { \"RaidBuff\",  484.703,  502.520, 1.3 },\n    { \"RaidBuff\",  604.734,  623.706, 1.3 },\n    { \"RaidBuff\",  725.768,  745.411, 1.3 },\n    { \"RaidBuff\",  845.888,  865.798, 1.3 },\n    { \"RaidBuff\",  968.340,  987.002, 1.3 },\n    { \"RaidBuff\", 1088.214, 1102.669, 1.3 },\n\t\n\t-- Boss Modifier\n\t-- Independently tracked on this so we can keep our Raid Buffs.\n\t--{ \"BossModifier\", 322.4, 381.5, 0.8 },\n\n    -- Higanbana. Lifetime and availability track each other: a target you cannot\n    -- reach is not worth planning a DoT into. Kefka through 381.5, then\n    -- Chaos/Exdeath from 427.5 until Exdeath dies ~729.\n    --[[{ \"TargetLifetime\",    0.0, 197.5, 1, 0 },\n    { \"TargetLifetime\",  207.9, 381.5, 1, 0 },\n    { \"TargetLifetime\",  427.5, 729.0, 1, 0 },\n    { \"DotAvailability\",   0.0, 197.5, 1, 0 },\n    { \"DotAvailability\", 207.9, 381.5, 1, 0 },\n    { \"DotAvailability\", 427.5, 729.0, 1, 0 },\n\t]]--\n}\n\nfor i = 1, #phases do\n    local p = phases[i]\n    acr.addAutoSimPhase(p[1], p[2], p[3], p[4], p[5])\n\td(p[1] .. \" added\")\nend\n\n-- P1 from the first Tele-trouncing cast (151.5) to Kefka leaving (197.5).\n-- The ID is kept so [AutoSim] P1 Low HP can lower this same phase in place\n-- once Kefka is low; a second BossModifier over the same window would overlap.\ndata.Cherry_AutoSimP1ModID = acr.addAutoSimPhase(\"BossModifier\", 151.5, 197.5, 0.8)\nd(\"P1 BossModifier added, id \" .. tostring(data.Cherry_AutoSimP1ModID))\n\n-- P3 padding up to limit cut (Ultima Blaster, 521.4): Chaos and Exdeath stacked\n-- within 6y (>=80% of 42 P3 clears, measured 2026-09-28), so AoE hits both.\n-- Only outside the Fated/Fabled Hero window: Anyone disables AOE at 430.6 when\n-- the hero buffs lock each player to one boss and re-enables it at 469.2, so\n-- the 437-457 stack does not count.\n\nlocal cleaveWindows = {\n    { 486, 513 },\n}\n\nfor i = 1, #cleaveWindows do\n    local w = cleaveWindows[i]\n    for j = 1, #aoeTypes do\n        acr.addAutoSimPhase(aoeTypes[j], w[1], w[2], 2)\n    end\nend\nd(\"P3 cleave windows added\")\n\n\nd(\"Autosim Opti added\")\n\nself.used = true\n",
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
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "-- Clocks, and what [AutoSim] P4 Start synced to (data.Cherry_AutoSimP4).\n-- Checkpoints are filled by [AutoSim] P4 Checkpoints.\nlocal acr      = TensorCore.API.TensorACR\nlocal now      = acr.getAutoSimTime()\nlocal timeline = TensorReactions_CurrentTimer or 0\nlocal combat   = TensorReactions_CurrentCombatTimer or 0\n\nlocal rec = data.Cherry_AutoSimP4\nif rec and now < rec.exdeathAt then\n    rec = nil   -- left over from an earlier pull\nend\n\nlocal function row(a, b, c, d, e)\n    GUI:Text(a)\n    GUI:SameLine(150) GUI:Text(b)\n    GUI:SameLine(220) GUI:Text(c)\n    GUI:SameLine(290) GUI:Text(d)\n    GUI:SameLine(360) GUI:Text(e)\nend\n\nlocal flags = GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize\nGUI:SetNextWindowSize(440, 0, GUI.SetCond_Always)\nlocal visible = GUI:Begin(\"AutoSim P4 Sync###CherryAutoSimP4Sync\", true, flags)\n\nif visible then\n    row(\"Clock\", \"Timeline\", \"Combat\", \"AutoSim\", \"\")\n    row(\"Now\", string.format(\"%.2f\", timeline), string.format(\"%.2f\", combat), string.format(\"%.2f\", now), \"\")\n    row(\"AutoSim minus\", string.format(\"%+.2f\", now - timeline), string.format(\"%+.2f\", now - combat), \"\", \"\")\n    GUI:Separator()\n\n    if not rec then\n        GUI:TextColored(0.6, 0.6, 0.6, 1.0, \"P4 not synced yet (syncs when Exdeath dies).\")\n    else\n        -- The timeline resyncs when Kefka appears, so AutoSim - Timeline is only a\n        -- real offset from then on.\n        local synced = rec.checks[1].actual ~= nil\n        local live   = now - timeline\n\n        GUI:Text(string.format(\"Exdeath died at %.2f; Kefka predicted %.2f (+%.2f)\",\n            rec.exdeathAt, 801.9 + rec.syncOffset, rec.kefkaDelay))\n        GUI:Text(string.format(\"Offset at sync %+.2f   in use %+.2f\", rec.syncOffset, rec.offset))\n        if synced then\n            local drift = live - rec.offset\n            local r, g, b = 0.3, 0.9, 0.4\n            if math.abs(drift) >= 1.5 then\n                r, g, b = 1.0, 0.4, 0.4\n            elseif math.abs(drift) >= 0.5 then\n                r, g, b = 0.95, 0.75, 0.2\n            end\n            GUI:TextColored(r, g, b, 1.0, string.format(\"Live offset %+.2f   drift %+.2f\", live, drift))\n        else\n            GUI:TextColored(0.6, 0.6, 0.6, 1.0, \"Live offset: waiting for Kefka (timeline not resynced)\")\n        end\n\n        GUI:Separator()\n        row(\"Checkpoint\", \"Timeline\", \"Expected\", \"Actual\", \"Drift\")\n        for i = 1, #rec.checks do\n            local c = rec.checks[i]\n            row(c.name,\n                string.format(\"%.1f\", c.timeline),\n                string.format(\"%.2f\", c.expected or (c.timeline + rec.offset)),\n                c.actual and string.format(\"%.2f\", c.actual) or \"-\",\n                c.drift and string.format(\"%+.2f\", c.drift) or \"-\")\n        end\n\n        GUI:Separator()\n        row(\"Phase\", \"Start\", \"End\", \"TL start\", \"ID\")\n        for i = 1, #rec.phases do\n            local p = rec.phases[i]\n            row(p.phaseType,\n                string.format(\"%.2f\", p.startTime),\n                string.format(\"%.2f\", p.endTime),\n                string.format(\"%.1f\", p.startTime - rec.offset),\n                tostring(p.id))\n        end\n\n        -- Moves every phase edge still in the future by the drift, so AutoSim\n        -- matches the resynced timeline again. Kill time (1116) is fixed.\n        if synced then\n            GUI:Separator()\n            if GUI:Button(string.format(\"Re-align future phases by %+.2f##CherryP4Realign\", live - rec.offset), -1, 24) then\n                local delta = live - rec.offset\n                for i = 1, #rec.phases do\n                    local p = rec.phases[i]\n                    if p.id then\n                        if p.startTime > now then p.startTime = p.startTime + delta end\n                        if p.endTime > now then p.endTime = p.endTime + delta end\n                        p.id = acr.setAutoSimPhase(p.id, p.startTime, p.endTime, p.value)\n                    end\n                end\n                rec.realigns[#rec.realigns + 1] = { at = now, from = rec.offset, to = live }\n                rec.offset = live\n            end\n        end\n\n        for i = 1, #rec.realigns do\n            local a = rec.realigns[i]\n            GUI:Text(string.format(\"Re-aligned at %.2f: %+.2f -> %+.2f\", a.at, a.from, a.to))\n        end\n    end\nend\n\nGUI:End()\nself.used = true\n",
							name = "Draw P4 sync window",
							uuid = "fd626228-dcbb-1f6c-bcc7-a4dedbb06830",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				eventType = 13,
				mechanicTime = 15.261765625,
				name = "[AutoSim] P4 Sync GUI",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 1200,
				timerStartOffset = -16,
				uuid = "fd997697-8c3d-c0f9-ab2b-8079085b96eb",
				version = 2,
			},
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
							actionLua = "local acr = TensorCore.API.TensorACR\nlocal now = acr.getAutoSimTime()\nlocal id = data.Cherry_AutoSimP1ModID\n\n-- Lower the Tele-trouncing BossModifier that [AutoSim] Start added, in place,\n-- rather than adding a second phase over the same window.\nif id and now < 197.5 then\n    acr.setAutoSimPhase(id, now, 197.5, 0.2)\n\td(\"Setting p1 modifer to 0.2\")\nend\n\nself.used = true\n",
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
				enabled = false,
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
							actionLua = "-- Fires when Exdeath goes untargetable (dies) at the end of P3, ~4.45s before\n-- Kefka appears, so AutoSim can plan the whole P4/P5 schedule ahead of time.\n-- The timeline window (711.9 - 803.9) keeps out the brief mid-P3 untargetable.\nif eventArgs.entityContentID ~= 6052 or eventArgs.isTargetable then\n    return\nend\n\nlocal acr = TensorCore.API.TensorACR\n\n-- The timeline has NOT resynced yet here (it jumps to 801.9 when Kefka appears),\n-- so anchor on the combat clock: Kefka is targetable 4.45s from now (measured\n-- 4.28-4.55 over 26 pulls). Timeline times below + offset = AutoSim time.\nlocal KEFKA_DELAY = 4.45\nlocal now    = acr.getAutoSimTime()\nlocal offset = now + KEFKA_DELAY - 801.9\n\nd(\"AutoSimTime: \" .. now)\nd(\"Offset: \" .. offset)\n\nacr.setAutoSimKillTime(1116)   -- already combat time, so no offset. Measured\n                               -- 1116.11 and 1116.25 on two clears.\nacr.clearAutoSimUncertainty()\n\n-- Replace the pre-P4 schedule. Clearing first also makes this safe to re-run.\nacr.clearAutoSimPhases(\"FullDowntime\")\nacr.clearAutoSimPhases(\"MeleeDowntime\")\nacr.clearAutoSimPhases(\"CasterDowntime\")\nacr.clearAutoSimPhases(\"TargetLifetime\", 0)\nacr.clearAutoSimPhases(\"DotAvailability\", 0)\n-- Ends the Exdeath-solo 0.6x from [AutoSim] Exdeath Solo 0.6x. The only other\n-- BossModifier (322.4-381.5) is long over by now.\nacr.clearAutoSimPhases(\"BossModifier\")\n\n-- { phaseType, startTime, endTime, value, targetSlot }, timeline times + offset.\nlocal phases = {\n    -- Nothing is targetable.\n    { \"FullDowntime\",  now,            801.9 + offset },  -- Exdeath dead until Kefka appears\n    { \"FullDowntime\",  934.7 + offset,  965.7 + offset },  -- Kefka untargetable, P4 -> P5\n\n    --[[ Higanbana. Kefka is one entity from the P4 start to the kill.\n    { \"TargetLifetime\",   801.9 + offset, 1185.3 + offset, 1, 0 },\n    { \"DotAvailability\",  801.9 + offset,  934.7 + offset, 1, 0 },\n    { \"DotAvailability\",  965.7 + offset, 1185.3 + offset, 1, 0 },\n\t]]--\n}\n\n-- Everything this sync decided, for the [AutoSim] P4 Sync GUI and re-aligning.\n-- AutoSim has no getter for phases, so the IDs are kept here.\n-- checks are Kefka's targetable changes, filled by [AutoSim] P4 Checkpoints.\nlocal rec = {\n    exdeathAt  = now,\n    kefkaDelay = KEFKA_DELAY,\n    offset     = offset,\n    syncOffset = offset,\n    phases     = {},\n    checks     = {\n        { name = \"Kefka P4 targetable\", timeline = 801.9, targetable = true },\n        { name = \"Kefka untargetable\",  timeline = 934.7, targetable = false },\n        { name = \"Kefka P5 targetable\", timeline = 965.7, targetable = true },\n    },\n    realigns   = {},\n}\n\nfor i = 1, #phases do\n    local p = phases[i]\n    rec.phases[i] = {\n        phaseType = p[1],\n        startTime = p[2],\n        endTime   = p[3],\n        value     = p[4] or 1,\n        id        = acr.addAutoSimPhase(p[1], p[2], p[3], p[4], p[5]),\n    }\nend\n\ndata.Cherry_AutoSimP4 = rec\n\nself.used = true\n",
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
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "-- Records when Kefka's targetable changes actually land on the AutoSim clock,\n-- next to where [AutoSim] P4 Start expected them (timeline time + offset).\n-- Shown by [AutoSim] P4 Sync GUI. Window 711.9 - 1005.4 covers all three.\nlocal rec = data.Cherry_AutoSimP4\nif not rec or eventArgs.entityContentID ~= 7131 then\n    return\nend\n\nlocal now = TensorCore.API.TensorACR.getAutoSimTime()\nif now < rec.exdeathAt then\n    return   -- left over from an earlier pull\nend\n\n-- Checks happen in order: P4 targetable, untargetable, P5 targetable.\nfor i = 1, #rec.checks do\n    local c = rec.checks[i]\n    if not c.actual then\n        if c.targetable ~= eventArgs.isTargetable then\n            return\n        end\n        c.actual   = now\n        c.expected = c.timeline + rec.offset\n        c.drift    = now - c.expected\n        self.used = true\n        return\n    end\nend\n",
							name = "Record Kefka targetable changes",
							uuid = "98083d12-771d-1f8c-82a5-c504498d35ee",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				eventType = 26,
				loop = true,
				mechanicTime = 715.37264047081,
				name = "[AutoSim] P4 Checkpoints",
				timeRange = true,
				timelineIndex = 148,
				timerEndOffset = 290,
				timerStartOffset = -3.5,
				uuid = "4968b69d-f5c3-1514-9c4e-24c3aa252748",
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