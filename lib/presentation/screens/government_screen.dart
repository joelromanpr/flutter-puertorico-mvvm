import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_puertorico_mvvm/data/models/government.dart';
import 'package:flutter_puertorico_mvvm/data/models/government_response.dart';
import 'package:flutter_puertorico_mvvm/di/locator.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/government_bloc.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/government_event.dart';
import 'package:flutter_puertorico_mvvm/presentation/bloc/government_state.dart';

class GovernmentScreen extends StatelessWidget {
  const GovernmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<GovernmentBloc>()..add(LoadGovernmentData()),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Government'),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Executive'),
                Tab(text: 'Legislative'),
                Tab(text: 'Judicial'),
                Tab(text: 'Federal'),
              ],
            ),
          ),
          body: BlocBuilder<GovernmentBloc, GovernmentState>(
            builder: (context, state) {
              if (state is GovernmentLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GovernmentLoaded) {
                final executive = state.governmentResponse.executiveBranch;
                final legislative = state.governmentResponse.legislativeBranch;
                final judicial = state.governmentResponse.judicialBranch;
                final federal = state.governmentResponse.federalRepresentation;

                return TabBarView(
                  children: [
                    _buildExecutiveTab(executive),
                    _buildLegislativeTab(legislative),
                    _buildJudicialTab(judicial),
                    _buildFederalTab(federal),
                  ],
                );
              } else if (state is GovernmentError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Welcome'));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildExecutiveTab(GovernmentBranch executive) {
    return ListView(
      children: [
        if (executive.governor != null) _buildOfficialTile(executive.governor!),
        const Divider(),
        ...executive.cabinet.map((official) => _buildOfficialTile(official)),
      ],
    );
  }

  Widget _buildLegislativeTab(GovernmentBranch legislative) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Senate'),
              Tab(text: 'House'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                if (legislative.senate != null)
                  _buildSenateTab(legislative.senate!),
                if (legislative.houseOfRepresentatives != null)
                  _buildHouseTab(legislative.houseOfRepresentatives!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSenateTab(Senate senate) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Leadership',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ...senate.leadership.map((official) => _buildOfficialTile(official)),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Senators',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ...senate.senators.map((official) => _buildOfficialTile(official)),
      ],
    );
  }

  Widget _buildHouseTab(HouseOfRepresentatives house) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Leadership',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ...house.leadership.map((official) => _buildOfficialTile(official)),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Representatives',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ...house.representatives.map(
          (official) => _buildOfficialTile(official),
        ),
      ],
    );
  }

  Widget _buildJudicialTab(GovernmentBranch judicial) {
    return ListView(
      children: [
        if (judicial.supremeCourt != null)
          _buildOfficialTile(judicial.supremeCourt!.chiefJustice),
        const Divider(),
        if (judicial.supremeCourt != null)
          ...judicial.supremeCourt!.associateJustices.map(
            (official) => _buildOfficialTile(official),
          ),
      ],
    );
  }

  Widget _buildFederalTab(GovernmentBranch federal) {
    return ListView(
      children: [
        if (federal.residentCommissioner != null)
          _buildOfficialTile(federal.residentCommissioner!),
      ],
    );
  }

  Widget _buildOfficialTile(Official official) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            official.profilePictureUrl ?? '',
          ),
          child: official.profilePictureUrl == null
              ? const Icon(Icons.person)
              : null,
        ),
        title: Text(official.name),
        subtitle: Text(official.position ?? official.district ?? ''),
        onTap: () {
          // Optional: Show more details
        },
      ),
    );
  }
}
