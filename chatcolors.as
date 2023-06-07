string[][] AuthIDS =
{
	{ 'STEAM_0:0:202010794 Mikk', 'yellow' },
	{ 'STEAM_ID NAME(optional)', 'blue' },
	{ 'STEAM_ID NAME(optional)', 'red' },
	{ 'STEAM_ID NAME(optional)', 'green' }
};

int GetColor( string c )
{
	return ( c == 'red' ? 17 : c == 'green' ? 19 : c == 'blue' ? 16 : c == 'yellow' ? 18 : -1 );
}

void PluginInit()
{
	g_Module.ScriptInfo.SetAuthor( "w00tguy" );
	g_Module.ScriptInfo.SetContactInfo( "https://github.com/wootguy" );

	g_Hooks.RegisterHook( Hooks::Player::ClientPutInServer, @ClientPutInServer );
	g_Hooks.RegisterHook( Hooks::Player::ClientSay, @ClientSay );
}

HookReturnCode ClientPutInServer( CBasePlayer@ pPlayer )
{
	if( pPlayer !is null )
	{
		PlayerState@ state = getPlayerState( pPlayer );

		int ic = pPlayer.Classify();

		if( ic >= 16 && ic <= 19 )
		{
			state.color = ic;
		}

		for( uint i = 0; i < AuthIDS.length(); i++ )
		{
			if( AuthIDS[i][0].StartsWith( string( g_EngineFuncs.GetPlayerAuthId( pPlayer.edict() ) ) ) )
			{
				state.color = GetColor( AuthIDS[i][1] );
			}
		}
	}
	return HOOK_CONTINUE;
}

dictionary g_player_states;

class PlayerState
{
	int color = -1; // classify value
}

// Will create a new state if the requested one does not exit
PlayerState@ getPlayerState( CBasePlayer@ pPlayer )
{
	if( pPlayer !is null && pPlayer.IsConnected() )
	{
		string steamId = g_EngineFuncs.GetPlayerAuthId( pPlayer.edict() );

		if( steamId == 'STEAM_ID_LAN' or steamId == 'BOT')
		{
			steamId = pPlayer.pev.netname;
		}
		
		if( !g_player_states.exists(steamId) )
		{
			PlayerState state;
			g_player_states[steamId] = state;
		}
		return cast<PlayerState@>( g_player_states[steamId] );
	}
	return null;
}

HookReturnCode ClientSay( SayParameters@ pParams )
{
	CBasePlayer@ pPlayer = pParams.GetPlayer();

	PlayerState@ state = getPlayerState( pPlayer );

	if( pParams.GetArguments().ArgC() > 0 && state.color > 0 )
	{
		int oldClassify = pPlayer.Classify();
		pPlayer.SetClassification( state.color );
		pPlayer.SendScoreInfo();
		pPlayer.SetClassification(oldClassify);
		g_Scheduler.SetTimeout("revert_scoreboard_color", 0.5f, EHandle( pPlayer ));
	}

	return HOOK_CONTINUE;
}

// keeping the scoreboard color would be neat too, but then you can't see hp/armor
void revert_scoreboard_color(EHandle h_plr)
{
	CBasePlayer@ plr = cast<CBasePlayer@>( h_plr.GetEntity() );

	if( plr is null or !plr.IsConnected() )
	{
		return;
	}
	plr.SendScoreInfo();
}