import Navigation from './components/Navigation';
import IssueButton from './components/IssueButton';
import IssueTable from './components/IssueTable';

export default function Home() {
	return (
		<div>
			<Navigation />
			<IssueTable />
			<IssueButton />
		</div>
	);
}
