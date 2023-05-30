void PluginInit()
{
    g_Module.ScriptInfo.SetAuthor( "Mikk" );
    g_Module.ScriptInfo.SetContactInfo( "https://discord.gg/VsNnE3A7j8" );
    g_Hooks.RegisterHook( Hooks::PickupObject::CanCollect, @CanCollect );
}

HookReturnCode CanCollect( CBaseEntity@ pPickup, CBaseEntity@ pOther, bool& out bResult )
{
    if( pPickup !is null )
    {
        if( !pPickup.pev.SpawnFlagBitSet( 128) && !pPickup.pev.SpawnFlagBitSet( 256 ) )
        {
            pPickup.pev.spawnflags += 256;
            bResult = false;
        }
    }
    return HOOK_CONTINUE;
}