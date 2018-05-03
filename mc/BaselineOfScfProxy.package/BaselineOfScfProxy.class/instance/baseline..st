baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec project: 'TCAP' with: [
				spec
					className: #ConfigurationOfTCAP;
					versionString: #bleedingEdge;
					loads: #('default' 'camel' );
					repository: 'http://smalltalkhub.com/mc/osmocom/TCAP/main/' ].
		spec project: 'OsmoCore' with: [
				spec
					className: #ConfigurationOfOsmoCore;
					versionString: '6';
					repository: 'http://smalltalkhub.com/mc/osmocom/Core/main/' ].
		spec project: 'OsmoLogging' with: [
				spec
					className: #ConfigurationOfOsmoLogging;
					versionString: '5';
					repository: 'http://smalltalkhub.com/mc/osmocom/Logging/main/' ].
		spec project: 'OsmoNetwork' with: [
				spec
					className: #ConfigurationOfOsmoNetwork;
					versionString: '6';
					repository: 'http://smalltalkhub.com/mc/osmocom/Network/main/' ].
		spec project: 'OsmoGSM' with: [
				spec
					className: #ConfigurationOfOsmoGSM;
					versionString: '2';
					repository: 'http://smalltalkhub.com/mc/osmocom/GSM/main/' ].
		spec project: 'StatsDClient' with: [
				spec
					className: #ConfigurationOfStatsDClient;
					versionString: '4';
					repository: 'http://smalltalkhub.com/mc/hfreyther2/StatsD/main/' ].
		spec project: 'ZincHTTPComponents' with: [
				spec
					className: #ConfigurationOfZincHTTPComponents;
					versionString: #bleedingEdge;
					loads: #('REST' );
					repository: 'http://mc.stfx.eu/ZincHTTPComponents' ].
		spec package: #ScfProxy with: [
				spec requires: #('TCAP' 'OsmoCore' 'OsmoLogging' 'OsmoNetwork' 'OsmoGSM' 'StatsDClient')]]