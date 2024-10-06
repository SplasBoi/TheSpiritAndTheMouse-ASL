state("TheSpiritAndTheMouse") {}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
}

init
{
    vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
    {
        vars.Helper["isLoading"] = mono.Make<bool>("PlayerGlobalData", "_instance", "isInLoading");
        return true;
    });
}

update
{
    vars.Helper.Update();
}

isLoading
{
    return vars.Helper["isLoading"].Current;
}