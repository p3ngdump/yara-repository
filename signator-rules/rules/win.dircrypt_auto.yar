rule win_dircrypt_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.dircrypt."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dircrypt"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { c705????????01000000 e8???????? e8???????? e8???????? e8???????? 833d????????00 }
            // n = 6, score = 900
            //   c705????????01000000     |     
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     
            //   833d????????00       |                     

        $sequence_1 = { e8???????? 05d3070000 50 6a01 }
            // n = 4, score = 900
            //   e8????????           |                     
            //   05d3070000           | add                 eax, 0x7d3
            //   50                   | push                eax
            //   6a01                 | push                1

        $sequence_2 = { 751a 68???????? e8???????? 05d2070000 }
            // n = 4, score = 900
            //   751a                 | jne                 0x1c
            //   68????????           |                     
            //   e8????????           |                     
            //   05d2070000           | add                 eax, 0x7d2

        $sequence_3 = { 7531 c705????????01000000 e8???????? e8???????? 833d????????00 }
            // n = 5, score = 900
            //   7531                 | jne                 0x33
            //   c705????????01000000     |     
            //   e8????????           |                     
            //   e8????????           |                     
            //   833d????????00       |                     

        $sequence_4 = { 833d????????00 751a 68???????? e8???????? 05d2070000 50 e8???????? }
            // n = 7, score = 900
            //   833d????????00       |                     
            //   751a                 | jne                 0x1c
            //   68????????           |                     
            //   e8????????           |                     
            //   05d2070000           | add                 eax, 0x7d2
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_5 = { ff15???????? a3???????? eb0a c705????????01000000 }
            // n = 4, score = 900
            //   ff15????????         |                     
            //   a3????????           |                     
            //   eb0a                 | jmp                 0xc
            //   c705????????01000000     |     

        $sequence_6 = { 8bec 51 ff15???????? 8945fc 8b450c 2b4508 50 }
            // n = 7, score = 900
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   2b4508               | sub                 eax, dword ptr [ebp + 8]
            //   50                   | push                eax

        $sequence_7 = { 68???????? 8d45dc 50 e8???????? 6a00 e8???????? 05d6070000 }
            // n = 7, score = 900
            //   68????????           |                     
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax
            //   e8????????           |                     
            //   6a00                 | push                0
            //   e8????????           |                     
            //   05d6070000           | add                 eax, 0x7d6

        $sequence_8 = { c705????????01000000 e8???????? e8???????? 833d????????00 7514 68???????? }
            // n = 6, score = 900
            //   c705????????01000000     |     
            //   e8????????           |                     
            //   e8????????           |                     
            //   833d????????00       |                     
            //   7514                 | jne                 0x16
            //   68????????           |                     

        $sequence_9 = { 833d????????00 7528 c705????????01000000 e8???????? e8???????? }
            // n = 5, score = 900
            //   833d????????00       |                     
            //   7528                 | jne                 0x2a
            //   c705????????01000000     |     
            //   e8????????           |                     
            //   e8????????           |                     

    condition:
        7 of them and filesize < 671744
}