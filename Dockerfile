FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /src
COPY ["DevOpsWorld.Client/DevOpsWorld.Client.csproj", "DevOpsWorld.Client/"]
RUN dotnet restore "DevOpsWorld.Client/DevOpsWorld.Client.csproj"
COPY . .
WORKDIR "/src/DevOpsWorld.Client"
RUN dotnet build "DevOpsWorld.Client.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "DevOpsWorld.Client.csproj" --no-restore -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
CMD ["dotnet", "DevOpsWorld.Client.dll"]
