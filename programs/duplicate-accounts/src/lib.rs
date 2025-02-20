use anchor_lang::prelude::*;

declare_id!("GNAx7Bnrdd8xVkd4ZzHeCeQutpAA39yreNAghryf4WqK");

#[program]
pub mod duplicate_accounts {
    use super::*;

    pub fn transfer_points(ctx: Context<TransferPoints>, amount: u64) -> Result<()> {
        let from_account = &mut ctx.accounts.from_account;
        let to_account = &mut ctx.accounts.to_account;
        
        from_account.points = from_account.points.checked_sub(amount).unwrap();
        to_account.points = to_account.points.checked_add(amount).unwrap();
        
        msg!("Transferred {} points", amount);
        Ok(())
    }
}

#[account]
#[derive(Default, Debug)]
pub struct AdminState {
    pub admin: Pubkey,
    pub points: u64,
}

#[derive(Accounts)]
pub struct TransferPoints<'info> {
    #[account(mut)]
    pub from_account: Account<'info, AdminState>,
    #[account(mut)]
    pub to_account: Account<'info, AdminState>,
    pub authority: Signer<'info>,
}
