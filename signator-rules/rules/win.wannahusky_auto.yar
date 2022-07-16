rule win_wannahusky_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.wannahusky."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.wannahusky"
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
        $sequence_0 = { 57 89d7 f3a5 8d8d98fbffff 89442404 }
            // n = 5, score = 100
            //   57                   | push                edi
            //   89d7                 | mov                 edi, edx
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8d8d98fbffff         | lea                 ecx, [ebp - 0x468]
            //   89442404             | mov                 dword ptr [esp + 4], eax

        $sequence_1 = { c74004???????? c74008???????? c7400c94cb4000 c74010ddcb4000 c740144ecc4000 c7401c1dcd4000 }
            // n = 6, score = 100
            //   c74004????????       |                     
            //   c74008????????       |                     
            //   c7400c94cb4000       | mov                 dword ptr [eax + 0xc], 0x40cb94
            //   c74010ddcb4000       | mov                 dword ptr [eax + 0x10], 0x40cbdd
            //   c740144ecc4000       | mov                 dword ptr [eax + 0x14], 0x40cc4e
            //   c7401c1dcd4000       | mov                 dword ptr [eax + 0x1c], 0x40cd1d

        $sequence_2 = { c705????????24000000 c705????????c0474200 c705????????eb1d4100 c705????????90b54100 c605????????01 }
            // n = 5, score = 100
            //   c705????????24000000     |     
            //   c705????????c0474200     |     
            //   c705????????eb1d4100     |     
            //   c705????????90b54100     |     
            //   c605????????01       |                     

        $sequence_3 = { c605????????11 c705????????80bb4100 c705????????00000000 c605????????02 c705????????70b24100 c705????????04000000 c705????????04000000 }
            // n = 7, score = 100
            //   c605????????11       |                     
            //   c705????????80bb4100     |     
            //   c705????????00000000     |     
            //   c605????????02       |                     
            //   c705????????70b24100     |     
            //   c705????????04000000     |     
            //   c705????????04000000     |     

        $sequence_4 = { 898554fbffff 85c0 0f858f040000 89c3 a1???????? b912000000 }
            // n = 6, score = 100
            //   898554fbffff         | mov                 dword ptr [ebp - 0x4ac], eax
            //   85c0                 | test                eax, eax
            //   0f858f040000         | jne                 0x495
            //   89c3                 | mov                 ebx, eax
            //   a1????????           |                     
            //   b912000000           | mov                 ecx, 0x12

        $sequence_5 = { c705????????04000000 c605????????11 c705????????002c4200 c705????????00000000 c605????????02 c705????????68b14100 }
            // n = 6, score = 100
            //   c705????????04000000     |     
            //   c605????????11       |                     
            //   c705????????002c4200     |     
            //   c705????????00000000     |     
            //   c605????????02       |                     
            //   c705????????68b14100     |     

        $sequence_6 = { c705????????18000000 c705????????20474200 c705????????c41d4100 c705????????48b54100 c705????????00000000 c705????????04000000 c705????????04000000 }
            // n = 7, score = 100
            //   c705????????18000000     |     
            //   c705????????20474200     |     
            //   c705????????c41d4100     |     
            //   c705????????48b54100     |     
            //   c705????????00000000     |     
            //   c705????????04000000     |     
            //   c705????????04000000     |     

        $sequence_7 = { c705????????90b54100 c605????????01 c705????????28000000 c705????????20484200 c705????????f91d4100 c705????????0a000000 c605????????02 }
            // n = 7, score = 100
            //   c705????????90b54100     |     
            //   c605????????01       |                     
            //   c705????????28000000     |     
            //   c705????????20484200     |     
            //   c705????????f91d4100     |     
            //   c705????????0a000000     |     
            //   c605????????02       |                     

        $sequence_8 = { e8???????? 83bdf0faffff00 8985e4faffff 7411 8b85f0faffff 833800 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   83bdf0faffff00       | cmp                 dword ptr [ebp - 0x510], 0
            //   8985e4faffff         | mov                 dword ptr [ebp - 0x51c], eax
            //   7411                 | je                  0x13
            //   8b85f0faffff         | mov                 eax, dword ptr [ebp - 0x510]
            //   833800               | cmp                 dword ptr [eax], 0

        $sequence_9 = { c705????????60f34100 c705????????174b4000 c705????????18000000 c705????????04000000 c605????????11 }
            // n = 5, score = 100
            //   c705????????60f34100     |     
            //   c705????????174b4000     |     
            //   c705????????18000000     |     
            //   c705????????04000000     |     
            //   c605????????11       |                     

    condition:
        7 of them and filesize < 862208
}