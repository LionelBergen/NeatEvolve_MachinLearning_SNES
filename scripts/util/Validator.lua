local Validator = {}
local Logger = require('../util/Logger')

function Validator.validateNumber(number, message)
    message = message or 'invalid number:'
    message = message .. ' ' .. (number or 'nil')
    if (number == nil or type(number) ~= 'number') then
        Logger.error(message)
        error(message)
    end
end

function Validator.validateIsNotNull(value, errorMessage)
    errorMessage = errorMessage or 'val was nil.'
    if value == nil then
        Logger.error(errorMessage)
        error(errorMessage)
    end
end

function Validator.validatePool(pool)
    Validator.validateIsNotNull(pool, 'pool was nil.')
    Validator.validateNumber(pool.generation, 'pool.generation was invalid.')
    Validator.validateNumber(pool.maxFitness, 'pool.maxFitness was invalid.')
    Validator.validateIsNotNull(pool.species, 'pool.species was nil.')

    for _,species in pairs(pool.species) do
        Validator.validateSpecies(species)
    end
end

function Validator.validateGene(gene)
    Validator.validateIsNotNull(gene, 'genome.genes was nil.')

    Validator.validateNumber(gene.into, 'pool.species.genome.into was invalid.')
    Validator.validateNumber(gene.out, 'pool.species.genome.out was invalid.')
    Validator.validateNumber(gene.weight, 'pool.species.genome.weight was invalid.')
    Validator.validateNumber(gene.innovation, 'pool.species.genome.innovation was invalid.')
end

function Validator.validateSpecies(species)
    Validator.validateNumber(species.topFitness, 'pool.species.topFitness was invalid.')
    Validator.validateNumber(species.staleness, 'pool.species.staleness was invalid.')
    Validator.validateIsNotNull(species.genomes, 'pool.species.genomes was nil.')

    for _,genome in pairs(species.genomes) do
        Validator.validateGenome(genome)
    end
end

function Validator.validateGenome(genome)
    Validator.validateNumber(genome.fitness, 'pool.species.genome.fitness was invalid.')
    Validator.validateNumber(genome.maxNeuron, 'pool.species.genome.maxNeuron was invalid.')
    Validator.validateIsNotNull(genome.mutationRates, 'genome.mutationRates was nil.')

    for mutation,rate in pairs(genome.mutationRates) do
        Validator.validateIsNotNull(mutation, 'pool.species.genome.mutationRates.mutation was invalid.')
        Validator.validateNumber(rate, 'pool.species.genome.mutationRates.rate was invalid.')
    end
    Validator.validateIsNotNull(genome.genes, 'genome.genes was nil.')

    for _,gene in pairs(genome.genes) do
        Validator.validateGene(gene)
    end
end


return Validator