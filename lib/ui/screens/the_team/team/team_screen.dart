import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'team_view_model.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeamViewModel()..fetchTeams(),
      child: Scaffold(
        appBar: AppBar(title: Text("Teams")),
        body: Consumer<TeamViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (viewModel.errorMessage.isNotEmpty) {
              return Center(child: Text(viewModel.errorMessage));
            }

            return ListView.builder(
              itemCount: viewModel.teams.length,
              itemBuilder: (context, index) {
                final team = viewModel.teams[index];
                return ListTile(
                  leading:
                      team.teamLogo.isNotEmpty
                          ? Image.network(team.teamLogo)
                          : Icon(Icons.error),
                  title: Text(team.teamName),
                  subtitle:
                      team.logo.isEmpty
                          ? Text("No logo")
                          : Text("Logo available"),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
