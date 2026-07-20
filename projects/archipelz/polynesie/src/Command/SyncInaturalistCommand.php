<?php

namespace App\Command;

use App\Service\InaturalistService;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

#[AsCommand(
    name: 'app:sync-inaturalist',
    description: 'Synchronise les observations iNaturalist en base de données',
)]
class SyncInaturalistCommand extends Command
{
    public function __construct(private InaturalistService $inaturalistService)
    {
        parent::__construct();
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $output->writeln('Synchronisation en cours...');

        $result = $this->inaturalistService->fetchAndStore();

        $output->writeln(sprintf('✅ %d nouveaux marqueurs importés.', $result['imported']));
        $output->writeln(sprintf('🔄 %d marqueurs mis à jour.', $result['updated']));

        return Command::SUCCESS;
    }
}